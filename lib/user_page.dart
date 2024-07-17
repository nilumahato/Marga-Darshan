import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'choose_route_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String startLocation = "";
  String destinationLocation = "";
  List<String> allLocations = [];
  List<String> filteredStartSuggestions = [];
  List<String> filteredDestinationSuggestions = [];

  @override
  void initState() {
    super.initState();
    loadLocations();
  }

  Future<void> loadLocations() async {
    final String response = await rootBundle.loadString('assets/routes.json');
    final List<dynamic> data = jsonDecode(response);

    Set<String> locationsSet = {};
    for (var route in data) {
      locationsSet.add(route['startLocation']);
      locationsSet.add(route['destinationLocation']);
      for (var stop in route['stops']) {
        locationsSet.add(stop['name']);
      }
    }

    setState(() {
      allLocations = locationsSet.toList();
    });
  }

  void _filterSuggestions(String query, bool isStartLocation) {
    if (isStartLocation) {
      setState(() {
        filteredStartSuggestions = allLocations
            .where((location) =>
                location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredDestinationSuggestions = allLocations
            .where((location) =>
                location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLocationInput(
              labelText: 'Start Location',
              onChanged: (value) {
                setState(() {
                  startLocation = value;
                });
                _filterSuggestions(value, true);
              },
              suggestions: filteredStartSuggestions,
            ),
            SizedBox(height: 10.h),
            _buildLocationInput(
              labelText: 'Destination Location',
              onChanged: (value) {
                setState(() {
                  destinationLocation = value;
                });
                _filterSuggestions(value, false);
              },
              suggestions: filteredDestinationSuggestions,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseRoutePage(
                      startLocation: startLocation,
                      destinationLocation: destinationLocation,
                    ),
                  ),
                );
              },
              child: const Text(
                "Show Routes",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInput({
    required String labelText,
    required ValueChanged<String> onChanged,
    required List<String> suggestions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: TextEditingController(
              text: labelText == 'Start Location'
                  ? startLocation
                  : destinationLocation),
          onChanged: (value) {
            onChanged(value);
          },
          cursorColor: Colors.green,
          style: TextStyle(color: Colors.green, fontSize: 16.sp),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.green, fontSize: 16.sp),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.5.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.5.w),
            ),
          ),
        ),
        if (suggestions.isNotEmpty)
          SizedBox(
            height: 100.h,
            child: ListView(
              children: suggestions.map((location) {
                return ListTile(
                  title: Text(location,
                      style: const TextStyle(color: Colors.green)),
                  onTap: () {
                    setState(() {
                      if (labelText == 'Start Location') {
                        startLocation = location;
                      } else {
                        destinationLocation = location;
                      }

                      onChanged(location);

                      filteredStartSuggestions = [];
                      filteredDestinationSuggestions = [];
                    });
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'route_details_page.dart';
import 'models.dart';

class ChooseRoutePage extends StatefulWidget {
  final String startLocation;
  final String destinationLocation;

  const ChooseRoutePage(
      {super.key,
      required this.startLocation,
      required this.destinationLocation});

  @override
  _ChooseRoutePageState createState() => _ChooseRoutePageState();
}

class _ChooseRoutePageState extends State<ChooseRoutePage> {
  List<RouteData> availableRoutes = [];

  @override
  void initState() {
    super.initState();
    loadRoutes();
  }

  Future<void> loadRoutes() async {
    final String response = await rootBundle.loadString('assets/routes.json');
    final List<dynamic> data = jsonDecode(response);
    setState(() {
      availableRoutes = data.map((json) => RouteData.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<RouteData> filteredRoutes = availableRoutes
        .where((route) =>
            (route.startLocation == widget.startLocation &&
                route.destinationLocation == widget.destinationLocation) ||
            (route.startLocation == widget.startLocation &&
                route.destinationLocation == 'Prithvi Chowk'))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Choose Route", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Available Routes:",
              style: TextStyle(color: Colors.green, fontSize: 18.sp),
            ),
            SizedBox(height: 10.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: filteredRoutes
                  .map(
                    (route) => ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RouteDetailsPage(routeData: route),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 16.w),
                      ),
                      child: Text(
                        route.selectedRoute,
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

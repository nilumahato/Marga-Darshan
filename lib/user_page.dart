import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'choose_route_page.dart';


class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String startLocation = "";
  String destinationLocation = "";

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
              },
            ),
            SizedBox(height: 10.h),
            _buildLocationInput(
              labelText: 'Destination Location',
              onChanged: (value) {
                setState(() {
                  destinationLocation = value;
                });
              },
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
  }) {
    return TextFormField(
      onChanged: onChanged,
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
    );
  }
}

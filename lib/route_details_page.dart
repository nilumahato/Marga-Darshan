import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'models.dart';

class RouteDetailsPage extends StatelessWidget {
  final RouteData routeData;

  const RouteDetailsPage({super.key, required this.routeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Route Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRouteHeader(routeData.selectedRoute),
            SizedBox(height: 20.h),
            _buildStopsInfo(routeData.stops),
            SizedBox(height: 20.h),
            const Divider(color: Colors.green),
            SizedBox(height: 10.h),
            _buildFaresSection(routeData.fare),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteHeader(String route) {
    return Text(
      "Route: $route",
      style: TextStyle(
          fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.green),
    );
  }

  Widget _buildStopsInfo(List<StopData> stops) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Stops:",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
        SizedBox(height: 5.h),
        Text(
          stops.map((stop) => stop.name).join(" - "),
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.green,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildFaresSection(FareData fare) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fares",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
        SizedBox(height: 10.h),
        _buildFareRow("With Student ID:", "Rs. ${fare.withStudentId}"),
        SizedBox(height: 5.h),
        _buildFareRow("Without Student ID:", "Rs. ${fare.withoutStudentId}"),
      ],
    );
  }

  Widget _buildFareRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18.sp, color: Colors.green),
        ),
        Text(
          amount,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      ],
    );
  }
}

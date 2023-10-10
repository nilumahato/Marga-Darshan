import 'package:flutter/material.dart';
import 'models.dart'; // Import the data models

class RouteDetailsPage extends StatelessWidget {
  final RouteData routeData;

  RouteDetailsPage({required this.routeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Details"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRouteHeader(routeData.selectedRoute),
            SizedBox(height: 20),
            _buildStopsInfo(routeData.stops),
            SizedBox(height: 20),
            Divider(color: Colors.green),
            SizedBox(height: 10),
            _buildFaresSection(routeData.fare),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteHeader(String route) {
    return Text(
      "Route: $route",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
    );
  }

  Widget _buildStopsInfo(List<StopData> stops) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Stops:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        SizedBox(height: 5),
        Text(
          stops.map((stop) => stop.name).join(" - "),
          style: TextStyle(fontSize: 18, color: Colors.green, fontStyle: FontStyle.italic),
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
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        SizedBox(height: 10),
        _buildFareRow("With Student ID:", "Rs. ${fare.withStudentId}"),
        SizedBox(height: 5),
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
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),
        Text(
          amount,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ],
    );
  }
}
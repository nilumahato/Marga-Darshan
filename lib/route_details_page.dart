import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRouteHeader(routeData.selectedRoute),
            const SizedBox(height: 20),
            _buildStopsInfo(routeData.stops),
            const SizedBox(height: 20),
            const Divider(color: Colors.green),
            const SizedBox(height: 10),
            _buildFaresSection(routeData.fare),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteHeader(String route) {
    return Text(
      "Route: $route",
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
    );
  }

  Widget _buildStopsInfo(List<StopData> stops) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Stops:",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: 5),
        Text(
          stops.map((stop) => stop.name).join(" - "),
          style: const TextStyle(
              fontSize: 18, color: Colors.green, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildFaresSection(FareData fare) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Fares",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: 10),
        _buildFareRow("With Student ID:", "Rs. ${fare.withStudentId}"),
        const SizedBox(height: 5),
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
          style: const TextStyle(fontSize: 18, color: Colors.green),
        ),
        Text(
          amount,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ],
    );
  }
}

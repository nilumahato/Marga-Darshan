
class RouteData {
  final String startLocation;
  final String destinationLocation;
  final String selectedRoute;
  final List<StopData> stops;
  final FareData fare;

  RouteData({
    required this.startLocation,
    required this.destinationLocation,
    required this.selectedRoute,
    required this.stops,
    required this.fare,
  });
}

class StopData {
  final String name;

  StopData({required this.name});
}

class FareData {
  final double withStudentId;
  final double withoutStudentId;

  FareData({required this.withStudentId, required this.withoutStudentId});
}
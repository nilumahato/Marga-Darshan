class StopData {
  final String name;

  StopData({required this.name});

  factory StopData.fromJson(Map<String, dynamic> json) {
    return StopData(name: json['name']);
  }
}

class FareData {
  final double withStudentId;
  final double withoutStudentId;

  FareData({required this.withStudentId, required this.withoutStudentId});

  factory FareData.fromJson(Map<String, dynamic> json) {
    return FareData(
      withStudentId: json['withStudentId'].toDouble(),
      withoutStudentId: json['withoutStudentId'].toDouble(),
    );
  }
}

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

  factory RouteData.fromJson(Map<String, dynamic> json) {
    var stopsFromJson = json['stops'] as List;
    List<StopData> stopsList =
        stopsFromJson.map((i) => StopData.fromJson(i)).toList();

    return RouteData(
      startLocation: json['startLocation'],
      destinationLocation: json['destinationLocation'],
      selectedRoute: json['selectedRoute'],
      stops: stopsList,
      fare: FareData.fromJson(json['fare']),
    );
  }
}

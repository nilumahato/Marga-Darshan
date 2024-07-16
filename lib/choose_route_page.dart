import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'route_details_page.dart';
import 'models.dart';

class ChooseRoutePage extends StatelessWidget {
  final String startLocation;
  final String destinationLocation;

  const ChooseRoutePage(
      {super.key,
      required this.startLocation,
      required this.destinationLocation});

  @override
  Widget build(BuildContext context) {
    List<RouteData> availableRoutes = [
      RouteData(
        startLocation: 'Bagar',
        destinationLocation: 'Prithvichock',
        selectedRoute: 'Route 1: Bagar - Airport',
        stops: [
          StopData(name: 'Bagar'),
          StopData(name: 'Nadipur'),
          StopData(name: 'Mahendrapool'),
          StopData(name: 'Chipledhunga'),
          StopData(name: 'New Road'),
          StopData(name: 'Sabhagriha Chock'),
          StopData(name: 'Prithvichock'),
        ],
        fare: FareData(withStudentId: 20.0, withoutStudentId: 35.0),
      ),
      RouteData(
        startLocation: 'Bagar',
        destinationLocation: 'Prithvichock',
        selectedRoute: 'Route 2: Bagar - Lakeside',
        stops: [
          StopData(name: 'Bagar'),
          StopData(name: 'Nadipur'),
          StopData(name: 'Mahendrapool'),
          StopData(name: 'Nayabazar'),
          StopData(name: 'Prithvichock'),
        ],
        fare: FareData(withStudentId: 15.0, withoutStudentId: 30.0),
      ),
      RouteData(
        startLocation: 'Bagar',
        destinationLocation: 'Khalte',
        selectedRoute: 'Route 1: Bagar - Khalte',
        stops: [
          StopData(name: 'Bagar'),
          StopData(name: 'Aamirtchock'),
          StopData(name: 'Khalte'),
        ],
        fare: FareData(withStudentId: 30.0, withoutStudentId: 45.0),
      ),
      RouteData(
        startLocation: 'Lakeside',
        destinationLocation: 'Mahendrapool',
        selectedRoute: 'Route 1: Lakeside - Bagar',
        stops: [
          StopData(name: 'Lakeside'),
          StopData(name: 'Rastra Bank Chock'),
          StopData(name: 'Birauta'),
          StopData(name: 'Pokhara Airport'),
          StopData(name: 'Prithvichock'),
          StopData(name: 'Sabhagriha Chock'),
          StopData(name: 'Mahendrapool'),
        ],
        fare: FareData(withStudentId: 35.0, withoutStudentId: 55.0),
      ),
      RouteData(
        startLocation: 'Lakeside',
        destinationLocation: 'Mahendrapool',
        selectedRoute: 'Route 2: Lakeside - Mahendra Gufa',
        stops: [
          StopData(name: 'Lakeside'),
          StopData(name: 'Rastra Bank Chock'),
          StopData(name: 'Ratan Chock'),
          StopData(name: 'Srijana Chock'),
          StopData(name: 'Sabhagriha Chock'),
          StopData(name: 'Mahendrapool'),
        ],
        fare: FareData(withStudentId: 25.0, withoutStudentId: 40.0),
      ),
      RouteData(
        startLocation: 'Lamachaur',
        destinationLocation: 'Birauta',
        selectedRoute: 'Route 1: Lamchaur - Chorepatan',
        stops: [
          StopData(name: 'Lamachaur'),
          StopData(name: 'Deep'),
          StopData(name: 'Bagar'),
          StopData(name: 'Nadipur'),
          StopData(name: 'Mahendrapool'),
          StopData(name: 'New Road'),
          StopData(name: 'Sabhagriha Chock'),
          StopData(name: 'Srijana Chock'),
          StopData(name: 'Ratan Chock'),
          StopData(name: 'Rastra Bank Chock'),
          StopData(name: 'Birauta'),
        ],
        fare: FareData(withStudentId: 30.0, withoutStudentId: 55.0),
      ),
    ];

    List<RouteData> filteredRoutes = availableRoutes
        .where((route) =>
            (route.startLocation == startLocation &&
                route.destinationLocation == destinationLocation) ||
            (route.startLocation == startLocation &&
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

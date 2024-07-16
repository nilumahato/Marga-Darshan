import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'user_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.green,
            appBarTheme: const AppBarTheme(
              color: Colors.green,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.green),
              bodyMedium: TextStyle(color: Colors.green),
              labelLarge: TextStyle(color: Colors.white),
            ),
          ),
          home: const Scaffold(
            body: MargaDarshanPage(),
          ),
        );
      },
    );
  }
}

class MargaDarshanPage extends StatelessWidget {
  const MargaDarshanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Marga Darshan",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _adminButton(context),
            SizedBox(height: 20.h),
            _userButton(context),
          ],
        ),
      ),
    );
  }

  Widget _adminButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(300.w, 50.h),
      ),
      onPressed: () {},
      child: Text(
        "Admin",
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),
    );
  }

  Widget _userButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(300.w, 50.h),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserPage()),
        );
      },
      child: Text(
        "User",
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),
    );
  }
}

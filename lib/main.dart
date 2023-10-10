import 'package:flutter/material.dart';
import 'user_page.dart'; // Import the UserPage class

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MargaDarshanPage(),
      ),
    ),
  );
}

class MargaDarshanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marga Darshan"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _adminButton(context),
            SizedBox(height: 20),
            _userButton(context),
          ],
        ),
      ),
    );
  }

  Widget _adminButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(300, 50),
        backgroundColor: Colors.green, // Set button background color to green
      ),
      onPressed: () {
        // Navigate to admin login page (not implemented in this example)
      },
      child: Text(
        "Admin",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _userButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(300, 50),
        backgroundColor: Colors.green, // Set button background color to green
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPage()),
        );
      },
      child: Text(
        "User",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
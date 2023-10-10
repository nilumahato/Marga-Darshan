import 'package:flutter/material.dart';
import 'choose_route_page.dart';// Import the ChooseRoutePage class

class UserPage extends StatefulWidget {
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
        title: Text("User Page"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            SizedBox(height: 10),
            _buildLocationInput(
              labelText: 'Destination Location',
              onChanged: (value) {
                setState(() {
                  destinationLocation = value;
                });
              },
            ),
            SizedBox(height: 20),
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
              child: Text(
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
      style: TextStyle(color: Colors.green), // Set text color to green
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.green),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
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
            const SizedBox(height: 10),
            _buildLocationInput(
              labelText: 'Destination Location',
              onChanged: (value) {
                setState(() {
                  destinationLocation = value;
                });
              },
            ),
            const SizedBox(height: 20),
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
      style: const TextStyle(color: Colors.green), 
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.green),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}

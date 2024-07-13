import 'package:flutter/material.dart';
import 'user_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MargaDarshanPage(),
      ),
    ),
  );
}

class MargaDarshanPage extends StatelessWidget {
  const MargaDarshanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Marga Darshan", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _adminButton(context),
            const SizedBox(height: 20),
            _userButton(context),
          ],
        ),
      ),
    );
  }

  Widget _adminButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 50),
        backgroundColor: Colors.green,
      ),
      onPressed: () {},
      child: const Text(
        "Admin",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _userButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 50),
        backgroundColor: Colors.green,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserPage()),
        );
      },
      child: const Text(
        "User",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

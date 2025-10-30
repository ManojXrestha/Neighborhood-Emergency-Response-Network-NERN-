import 'package:flutter/material.dart';

class EmergencyAlertsPage extends StatelessWidget {
  const EmergencyAlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Emergency Alerts"),
        backgroundColor: Colors.redAccent,
      ),
      body: const Center(
        child: Text(
          "No new alerts at the moment.",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

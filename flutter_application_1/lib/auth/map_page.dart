import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Text(
          "Map feature will appear here.",
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ),
    );
  }
}

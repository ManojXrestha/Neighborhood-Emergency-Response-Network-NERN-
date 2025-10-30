import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login.dart';
import 'package:flutter_application_1/auth/signup_page.dart';
import 'package:flutter_application_1/auth/home_page.dart';
import 'package:flutter_application_1/auth/emergency_alerts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Auth Navigation Demo",
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
        '/emergency-alerts': (context) => const EmergencyAlertsPage(),
      },
    );
  }
}
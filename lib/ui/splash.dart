import 'dart:async';
import 'package:flutter/material.dart';
import 'package:form/ui/screen1.dart';
import 'package:form/ui/screen6.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer to navigate to Personal Info page after 3 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => SchoolRepresentative(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFE6D7B8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content goes here
            Image.asset(
              'assets/images/logo.jpg', // Replace 'assets/logo.png' with your asset image path
              width: 300, // Adjust the width as needed
              height: 300, // Adjust the height as needed
            ),
            SizedBox(height: 20),
            Text(
              'West Texas Driving Academy LLC.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

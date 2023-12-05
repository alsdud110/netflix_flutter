import 'package:flutter/material.dart';
import 'package:netflix_flutter/screens/profile/profile_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/Splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
    });

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Netflix Play",
          style: TextStyle(
              color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

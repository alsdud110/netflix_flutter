import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main_screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("MainScreen")),
    );
  }
}

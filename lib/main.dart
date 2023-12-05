import 'package:flutter/material.dart';
import 'package:netflix_flutter/routes.dart';
import 'package:netflix_flutter/screens/splash/splash_screen.dart';
import 'package:netflix_flutter/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: route,
      theme: theme(),
    );
  }
}

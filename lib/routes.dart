import 'package:flutter/material.dart';
import 'package:netflix_flutter/screens/home/home_screen.dart';
import 'package:netflix_flutter/screens/main_screen.dart';
import 'package:netflix_flutter/screens/profile/profile_screen.dart';
import 'package:netflix_flutter/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};

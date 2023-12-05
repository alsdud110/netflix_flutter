import 'package:flutter/material.dart';
import 'package:netflix_flutter/constants.dart';

ThemeData theme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(color: Colors.black),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: kTextColor),
    ),
  );
}

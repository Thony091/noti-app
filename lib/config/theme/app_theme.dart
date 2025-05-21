
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ModuCalorieTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.lightGreen,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0.0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(45.0),
          backgroundColor: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18.0),
        bodyMedium: TextStyle(fontSize: 16.0),
        bodySmall: TextStyle(fontSize: 14.0),
        labelLarge: TextStyle(color: Colors.grey, fontSize: 18.0),
        labelMedium: TextStyle(color: Colors.grey, fontSize: 16.0),
        labelSmall: TextStyle(color: Colors.grey, fontSize: 14.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
      datePickerTheme: const DatePickerThemeData(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      // Add more theme properties here
    );
  }
}

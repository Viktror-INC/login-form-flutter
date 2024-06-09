import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.white,
      focusColor: Color(0xFF6F91BC),
      colorScheme: const ColorScheme.light(
        primary: Colors.transparent,
        secondary: Color(0xFF70C3FF),
        tertiary: Color(0xFF4B65FF)
      ),
      textTheme: const TextTheme(),
    );
  }
}

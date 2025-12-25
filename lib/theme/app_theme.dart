import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
    appBarTheme: const AppBarTheme(color: Colors.deepPurple),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    appBarTheme: const AppBarTheme(color: Colors.deepPurple),
  );
}

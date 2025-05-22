import 'package:flutter/material.dart';

final lightPurpleTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: const Color(0xFFF6F4FB),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
    accentColor: Colors.deepPurpleAccent,
    backgroundColor: const Color(0xFFF6F4FB),
    brightness: Brightness.light,
  ).copyWith(
    secondary: Colors.deepPurpleAccent,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF7C4DFF),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF7C4DFF),
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Color(0xFF512DA8)),
    titleLarge: TextStyle(
      color: Color(0xFF512DA8),
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(color: Colors.black87),
  ),
);

final darkPurpleTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: const Color(0xFF23223B),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
    accentColor: Colors.deepPurpleAccent,
    backgroundColor: const Color(0xFF23223B),
    brightness: Brightness.dark,
  ).copyWith(
    secondary: Colors.deepPurpleAccent,
    surface: const Color(0xFF2D284D),
    onSurface: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF512DA8),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF2D284D),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF7C4DFF),
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.white70),
  ),
);

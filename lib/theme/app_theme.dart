import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTealTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: const Color(0xFFF6FCFA),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    accentColor: Colors.tealAccent,
    backgroundColor: const Color(0xFFF6FCFA),
    brightness: Brightness.light,
  ).copyWith(
    secondary: Colors.tealAccent,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal.shade600,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.playfairDisplay(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.0,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.teal.shade900,
      letterSpacing: 1.2,
    ),
    headlineMedium: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.teal.shade800,
      letterSpacing: 1.1,
    ),
    headlineSmall: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.teal.shade800,
    ),
    titleLarge: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.teal.shade800,
    ),
    titleMedium: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.teal.shade700,
    ),
    titleSmall: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.teal.shade700,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 16,
      color: Colors.black87,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.montserrat(fontSize: 15, color: Colors.black87),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 13,
      color: Colors.teal.shade800,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      color: Colors.teal.shade800,
    ),
  ),
);

final darkTealTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: const Color(0xFF182329),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    accentColor: Colors.tealAccent,
    backgroundColor: const Color(0xFF182329),
    brightness: Brightness.dark,
  ).copyWith(
    secondary: Colors.tealAccent,
    surface: const Color(0xFF22343C),
    onSurface: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal.shade900,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.playfairDisplay(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.0,
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF22343C),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.tealAccent,
      letterSpacing: 1.2,
    ),
    headlineMedium: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.tealAccent.shade100,
      letterSpacing: 1.1,
    ),
    headlineSmall: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.tealAccent.shade100,
    ),
    titleLarge: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.tealAccent,
    ),
    titleMedium: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.tealAccent.shade100,
    ),
    titleSmall: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.tealAccent.shade100,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 16,
      color: Colors.white,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.montserrat(fontSize: 15, color: Colors.white70),
    bodySmall: GoogleFonts.montserrat(fontSize: 13, color: Colors.tealAccent),
    labelLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      color: Colors.tealAccent,
    ),
  ),
);

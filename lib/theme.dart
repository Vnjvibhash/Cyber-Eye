import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Top-level class for Light Mode colors derived from the image
class LightModeColors {
  static const primary = Color(0xFF2F56F8);
  static const primaryVariant = Color(0xFF7097F5);
  static const secondary = Color(0xFFC72FF8);
  static const secondaryVariant = Color(0xFF3AF9EF);

  // Text Colors
  static const textPrimary = Color(0xFF3F3D56);
  static const textSecondary = Colors.grey;

  // Background Colors
  static const background = Colors.white;
  static const surface = Color(0xFFF7F7FA);

  // Other UI Colors
  static const success = Colors.green;
  static const error = Color(0xFFD32F2F);
}

// Top-level class for a corresponding Dark Mode
class DarkModeColors {
  // Gradient and Button Colors
  static const primary = Color(0xFF5882F5);
  static const primaryVariant = Color(0xFF7A9FF8);
  static const secondary = Color(0xFFB85BC5);
  static const secondaryVariant = Color(0xFF3AD3F9);

  // Text Colors
  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFFa0a0a0);

  // Background Colors
  static const background = Color(0xFF121212);
  static const surface = Color(0xFF1E1E1E);

  // Other UI Colors
  static const success = Color(0xFF388E3C);
  static const error = Color(0xFFEF5350);
}

class AppTheme {
  AppTheme._();

  // --- TEXT THEMES ---
  static final _lightTextTheme = GoogleFonts.orbitronTextTheme().apply(
    bodyColor: LightModeColors.textPrimary,
    displayColor: LightModeColors.textPrimary,
  );

  static final _darkTextTheme = GoogleFonts.orbitronTextTheme().apply(
    bodyColor: DarkModeColors.textPrimary,
    displayColor: DarkModeColors.textPrimary,
  );

  // --- LIGHT THEME DEFINITION ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: LightModeColors.primary,
    scaffoldBackgroundColor: LightModeColors.background,
    colorScheme: const ColorScheme.light(
      primary: LightModeColors.primary,
      secondary: LightModeColors.secondary,
      surface: LightModeColors.surface,
      background: LightModeColors.background,
      error: LightModeColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: LightModeColors.textPrimary,
      onBackground: LightModeColors.textPrimary,
      onError: Colors.white,
    ),
    textTheme: _lightTextTheme,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: LightModeColors.textSecondary),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: LightModeColors.primary),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      suffixIconColor: LightModeColors.textSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: LightModeColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: LightModeColors.primary),
    ),
  );

  // --- DARK THEME DEFINITION ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: DarkModeColors.primary,
    scaffoldBackgroundColor: DarkModeColors.background,
    colorScheme: const ColorScheme.dark(
      primary: DarkModeColors.primary,
      secondary: DarkModeColors.secondary,
      surface: DarkModeColors.surface,
      background: DarkModeColors.background,
      error: DarkModeColors.error,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: DarkModeColors.textPrimary,
      onBackground: DarkModeColors.textPrimary,
      onError: Colors.black,
    ),
    textTheme: _darkTextTheme,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: DarkModeColors.textSecondary),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: DarkModeColors.primary),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      suffixIconColor: DarkModeColors.textSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: DarkModeColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: DarkModeColors.primary),
    ),
  );
}

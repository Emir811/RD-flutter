import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

const lightColors = {
  "primary": Color(0xFF7F4A9F), 
  "onPrimary": Color(0xFFFFFFFF), 
  "secondary": Color(0xFFF1F1F1), 
  "onSecondary": Color(0xFF524C64), 
  "surface": Color(0xFFFFFFFF), 
  "onSurface": Color(0xFF524C64), 
  "success": Colors.green,
  "error": Colors.red,
  "onError": Colors.white,
};

const darkColors = {
  "primary": Color(0xFF512D6D), 
  "onPrimary": Color(0xFFF1F1F1), 
  "secondary": Color(0xFF232B36), 
  "onSecondary": Color(0xFFF1F1F1), 
  "surface": Color(0xFF171D2B), 
  "onSurface": Color(0xFFF5F5F5), 
  "success": Colors.green,
  "error": Colors.red,
  "onError": Colors.white,
};


final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: lightColors["primary"]!,
    onPrimary: lightColors["onPrimary"]!,
    secondary: lightColors["secondary"]!,
    onSecondary: lightColors["onSecondary"]!,
    error: lightColors["error"]!,
    onError: lightColors["onError"]!,
    surface: lightColors["surface"]!,
    onSurface: lightColors["onSurface"]!,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.roboto(),
    bodyMedium: GoogleFonts.roboto(),
    bodyLarge: GoogleFonts.roboto(),
    labelSmall: GoogleFonts.roboto(),
    labelMedium: GoogleFonts.roboto(),
    labelLarge: GoogleFonts.roboto(),
    titleSmall: GoogleFonts.roboto(),
    titleMedium: GoogleFonts.roboto(),
    titleLarge: GoogleFonts.roboto(),
    headlineSmall: GoogleFonts.aBeeZee(),
    headlineMedium: GoogleFonts.aBeeZee(),
    headlineLarge: GoogleFonts.aBeeZee(),
    displaySmall: GoogleFonts.abrilFatface(),
    displayMedium: GoogleFonts.abrilFatface(),
    displayLarge: GoogleFonts.abrilFatface(),
  ),
);


final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: darkColors["primary"]!, //
    onPrimary: darkColors["onPrimary"]!,
    secondary: darkColors["secondary"]!,
    onSecondary: darkColors["onSecondary"]!,
    error: darkColors["error"]!,
    onError: darkColors["onError"]!,
    surface: darkColors["surface"]!,
    onSurface: darkColors["onSurface"]!,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.roboto(),
    bodyMedium: GoogleFonts.roboto(),
    bodyLarge: GoogleFonts.roboto(),
    labelSmall: GoogleFonts.roboto(),
    labelMedium: GoogleFonts.roboto(),
    labelLarge: GoogleFonts.roboto(),
    titleSmall: GoogleFonts.roboto(),
    titleMedium: GoogleFonts.roboto(),
    titleLarge: GoogleFonts.roboto(),
    headlineSmall: GoogleFonts.aBeeZee(),
    headlineMedium: GoogleFonts.aBeeZee(),
    headlineLarge: GoogleFonts.aBeeZee(),
    displaySmall: GoogleFonts.abrilFatface(),
    displayMedium: GoogleFonts.abrilFatface(),
    displayLarge: GoogleFonts.abrilFatface(),
  ),
);

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AppTheme { Dark, Light }

/// A map of all of the vailable themes in our app.
///
/// The dark theme emulates the Material Design Darker High Contrast theme from
/// VS Code.
/// The light theme emulates the Material Theme Lighter High Contrast theme from
/// VS Code.
final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColorDark: const Color(0xFF000000),
    primaryColor: const Color(0xFF212121),
    primaryColorLight: const Color(0xFF424242),
    accentColor: const Color(0xFFE1DAC1),
    fontFamily: 'Poppins',
  ),
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF000000),
    primaryColorDark: const Color(0xFF000000),
    accentColor: const Color(0xFF000000),
    fontFamily: 'Poppins',
  ),
};

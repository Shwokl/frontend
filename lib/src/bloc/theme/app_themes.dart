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
  AppTheme.Dark: ThemeData.dark().copyWith(
    primaryColorDark: const Color(0xFF1d2d50),
    primaryColor: const Color(0xFF133b5c),
    primaryColorLight: const Color(0xFF1e5f74),
    accentColor: const Color(0xFFfcdab7),
  ),
  AppTheme.Light: ThemeData.light().copyWith(
    primaryColorDark: const Color(0xFFd37815),
    primaryColor: const Color(0xFFcad315),
    primaryColorLight: const Color(0xFFe4e978),
    accentColor: const Color(0xFFf2f4c0),
  ),
};

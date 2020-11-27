import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AppTheme { Dark, Light }

final appThemeData = {
  AppTheme.Dark: ThemeData.dark().copyWith(  // https://colorhunt.co/palette/207331
    primaryColorDark: const Color(0xFF1d2d50),
    primaryColor: const Color(0xFF133b5c),
    primaryColorLight: const Color(0xFF1e5f74),
    accentColor: const Color(0xFFfcdab7),
  ),
  AppTheme.Light: ThemeData.light().copyWith(  // https://colorhunt.co/palette/220216
    primaryColorDark: const Color(0xFFd37815),
    primaryColor: const Color(0xFFcad315),
    primaryColorLight: const Color(0xFFe4e978),
    accentColor: const Color(0xFFf2f4c0),
  ),
};
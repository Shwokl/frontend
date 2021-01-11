// External imports
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Local imports
import 'app_themes.dart';

// Local exports, to make importing easier later on
export 'app_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

/// Handle all theme switching events.
///
/// This BLoC handles all the [ThemeSwitchEvent] events. These indicate that,
/// given the fact that there are really only 2 themes, we need to toggle between
/// them.
/// As such, if the current theme is of the light variand and a [ThemeSwitchEvent]
/// is encountered, we need to switch to the dark variant, and vice versa.
class ThemeBloc extends Bloc<ThemeSwitchEvent, ThemeState> {
  final AppTheme initialTheme;
  ThemeBloc(this.initialTheme)
      : super(
          initialTheme == AppTheme.Dark ? DarkThemeState() : LightThemeState(),
        );

  @override
  Stream<ThemeState> mapEventToState(ThemeSwitchEvent event) async* {
    // normally, we'd have to check the type of event that we received, but in
    // this case, there is only one possible event, and that tells us to switch
    // from dark theme to light theme, or vice versa.
    yield (state is DarkThemeState) ? LightThemeState() : DarkThemeState();

    // TODO: notify preferences or something to make change persist between
    // TODO: app launches.
  }
}

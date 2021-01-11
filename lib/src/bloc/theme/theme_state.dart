part of 'theme_bloc.dart';

/// An abstract class from which all subsequent theme states are extended.
///
/// It stores the current theme data.
abstract class ThemeState extends Equatable {
  final ThemeData themeData;
  const ThemeState({
    @required this.themeData, // the current theme
  });

  @override
  List<Object> get props => [themeData];
}

/// An implementation of [ThemeState] that sets [themeData] to the dark theme
class DarkThemeState extends ThemeState {
  DarkThemeState()
      : super(
          themeData: appThemeData[AppTheme.Dark] ?? ThemeData.dark(),
        );
}

/// An implementation of [ThemeState] that sets [themeData] to the light theme
class LightThemeState extends ThemeState {
  LightThemeState()
      : super(
          themeData: appThemeData[AppTheme.Light] ?? ThemeData.light(),
        );
}

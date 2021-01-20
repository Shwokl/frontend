// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Local imports
import '../../../../../bloc/theme/theme_bloc.dart';
import '../generic/circle_button.dart';

class ThemeButton extends StatelessWidget {
  final double scale;
  const ThemeButton({this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      scale: scale,
      onPressed: () {
        BlocProvider.of<ThemeBloc>(context).add(const ThemeSwitchEvent());
      },
      icon: Theme.of(context).brightness == Brightness.dark
          ? MdiIcons.weatherSunny
          : MdiIcons.weatherNight,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/theme/theme_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle_button.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton();

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      onPressed: () {
        BlocProvider.of<ThemeBloc>(context).add(const ThemeSwitchEvent());
      },
      icon: Theme.of(context).brightness == Brightness.dark
          ? MdiIcons.weatherSunny
          : MdiIcons.weatherNight,
    );
  }
}

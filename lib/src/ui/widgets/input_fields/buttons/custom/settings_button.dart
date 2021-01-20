// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../utils/navigation.dart';
import '../generic/circle_button.dart';

class SettingsButton extends StatelessWidget {
  final double scale;
  const SettingsButton({this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      scale: scale,
      onPressed: () => navigateToSettings(context),
      icon: Icons.settings_outlined,
    );
  }
}

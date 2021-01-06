import 'package:flutter/material.dart';

import '../../../utils/navigation.dart';
import 'circle_button.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton();

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      onPressed: () => navigateToSettings(context),
      icon: Icons.settings_outlined,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/src/ui/utils/navigation.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/nav_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/settings_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/theme_button.dart';

class WebNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      navItems: [
        NavButton(
          text: 'Dashboard',
          onPressed: () => navigateToDashboard(context),
        )
      ],
      trailingIcons: const [ThemeButton(), SettingsButton()],
    );
  }
}

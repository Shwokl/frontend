// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../ui/utils/navigation.dart';
import '../../../../ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import '../../../../ui/widgets/input_fields/buttons/custom/settings_button.dart';
import '../../../../ui/widgets/input_fields/buttons/custom/theme_button.dart';
import '../../../../ui/widgets/input_fields/buttons/generic/nav_button.dart';

class WebNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      navItems: [
        NavButton(
          text: 'Home',
          onPressed: () => navigateToHome(context),
        )
      ],
      trailingIcons: const [ThemeButton(), SettingsButton()],
    );
  }
}

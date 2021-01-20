import 'package:flutter/material.dart';
import 'package:frontend/src/ui/utils/navigation.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/custom/settings_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/custom/theme_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/generic/nav_button.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: CustomAppBar(
        navItems: [
          NavButton(
            text: 'Home',
            onPressed: () => navigateToHome(context),
            isAccent: true,
          ),
        ],
        trailingIcons: const [
          ThemeButton(),
          SettingsButton(),
        ],
      ),
    );
  }
}

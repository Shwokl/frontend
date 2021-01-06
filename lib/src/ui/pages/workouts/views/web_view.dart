import 'package:flutter/material.dart';
import 'package:frontend/src/ui/utils/navigation.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/nav_button.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      fakeAppBar: CustomAppBar(
        navItems: [
          NavButton(
            text: "Dashboard",
            onPressed: () => navigateToDashboard(context),
          ),
          NavButton(
            accent: true,
            text: "Workouts",
            onPressed: () {},
          ),
          NavButton(
            text: "History",
            onPressed: () => navigateToHistory(context),
          ),
        ],
      ),
    );
  }
}

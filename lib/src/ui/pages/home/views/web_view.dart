import 'package:flutter/material.dart';

// Local imports
import '../../../../data/shwokl/users/user.dart';
import '../../../../ui/utils/navigation.dart';
import '../../../../ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import '../../../../ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import '../../../../ui/widgets/input_fields/buttons/custom/settings_button.dart';
import '../../../../ui/widgets/input_fields/buttons/custom/theme_button.dart';
import '../../../../ui/widgets/input_fields/buttons/generic/nav_button.dart';
import '../../../../ui/widgets/templates/user_card/user_card.dart';

class WebView extends StatelessWidget {
  final User user;

  const WebView({
    @required this.user,
  });

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
      body: SingleChildScrollView(
        child: Row(
          children: [
            UserCard(user),
          ],
        ),
      ),
    );
  }
}

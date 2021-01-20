// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../data/shwokl/users/user.dart';
import '../../../../data/shwokl/workout_logs/workout_log.dart';
import '../../../utils/navigation.dart';
import '../../../widgets/cards/calendar_card.dart';
import '../../../widgets/cards/user_card/user_card.dart';
import '../../../widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import '../../../widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import '../../../widgets/input_fields/buttons/custom/settings_button.dart';
import '../../../widgets/input_fields/buttons/custom/theme_button.dart';
import '../../../widgets/input_fields/buttons/generic/nav_button.dart';

class WebView extends StatelessWidget {
  final User user;
  final List<WorkoutLog> logs;

  const WebView({
    @required this.user,
    @required this.logs,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

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
        child: Column(
          children: [
            const SizedBox(height: 32.0),
            Row(
              children: [
                Column(
                  children: [],
                ),
                const Expanded(child: SizedBox()),
                if (width > 1500)
                  Column(
                    children: [
                      UserCard(user),
                      const SizedBox(height: 8.0),
                      CalendarCard(logs),
                      const SizedBox(height: 8.0),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

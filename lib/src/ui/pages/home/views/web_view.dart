// External imports
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/src/data/shwokl/workout_plans/workout_plan.dart';
import 'package:frontend/src/ui/widgets/cards/graph_card.dart';
import 'package:frontend/src/ui/widgets/cards/workout_plan_card/workout_plan_card.dart';

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
  final List<WorkoutPlan> plans;

  final double _ogWidth = 3840;
  final double _ogHeight = 2000;

  const WebView({
    @required this.user,
    @required this.logs,
    @required this.plans,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double wScale = width / _ogWidth;
    final double hScale = height / _ogHeight;

    List<Widget> _renderPlans() {
      final List<Widget> rendered = List.empty(growable: true);

      // ignore: avoid_function_literals_in_foreach_calls
      plans.forEach((element) {
        rendered.add(WorkoutPlanCard(
          element,
          scale: min<double>(wScale, hScale),
        ));
      });

      return rendered;
    }

    return BackgroundScaffold(
      appBar: CustomAppBar(
        navItems: [
          NavButton(
            text: 'Home',
            onPressed: () => navigateToHome(context),
            isAccent: true,
          ),
        ],
        trailingIcons: [
          ThemeButton(scale: wScale),
          SettingsButton(scale: wScale)
        ],
      ),
      body: SingleChildScrollView(
        child: TwoPaneLayout(
          showRight: width > 1500,
          left: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Available workout plans',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.end,
                spacing: 8.0,
                runSpacing: 8.0,
                children: _renderPlans(),
              ),
            ),
          ],
          right: [
            UserCard(user, scale: wScale),
            const SizedBox(height: 8.0),
            CalendarCard(logs, scale: wScale),
            const SizedBox(height: 8.0),
            ChartCard(
              'Weight loss graph',
              const [
                DataPoints(1, 80),
                DataPoints(2, 75),
                DataPoints(3, 77),
                DataPoints(4, 70),
                DataPoints(5, 74),
                DataPoints(6, 68),
                DataPoints(7, 71),
                DataPoints(8, 67),
                DataPoints(9, 69),
                DataPoints(10, 64),
              ],
              scale: wScale,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}

class TwoPaneLayout extends StatelessWidget {
  final List<Widget> left;
  final List<Widget> right;
  final bool showRight;
  const TwoPaneLayout({
    @required this.left,
    @required this.right,
    this.showRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Column(children: left)),
        if (showRight) const SizedBox(width: 16),
        if (showRight) Column(children: right),
      ],
    );
  }
}

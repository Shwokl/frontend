// External imports
import 'dart:math';
import 'package:flutter/material.dart';

// Local imports
import '../../../../data/shwokl/workout_plans/workout_plan.dart';
import 'components/all.dart';

class WorkoutPlanCard extends StatelessWidget {
  final WorkoutPlan plan;
  final double scale;
  const WorkoutPlanCard(this.plan, {this.scale = 1});

  @override
  Widget build(BuildContext context) {
    const double minWidth = 300;
    const double minHeight = 180;
    const double referenceWidth = 500;
    const double referenceHeight = 300;

    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: SizedBox(
        width: max(minWidth, referenceWidth * scale),
        height: max(minHeight, referenceHeight * scale),
        child: Stack(
          children: [
            CardBackground(plan.image, height: 350),
            CardTitle(plan.name),
            CardCreator(plan.creator.name),
            InkWell(
              splashColor: Theme.of(context).accentColor,
              onTap: () => print('Tapped me'), // TODO navigate to page
            ),
          ],
        ),
      ),
    );
  }
}

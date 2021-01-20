// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../data/shwokl/workout_plans/workout_plan.dart';
import 'components/all.dart';

class WorkoutPlanCard extends StatelessWidget {
  final WorkoutPlan plan;
  const WorkoutPlanCard(this.plan);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: 500,
        height: 350,
        child: Stack(
          children: [
            CardBackground(plan.image, height: 350),
            CardTitle(plan.name),
            CardCreator(plan.creator.name),
            InkWell(
              splashColor: Theme.of(context).accentColor,
              onTap: () => print('Tapped me'),
            ),
          ],
        ),
      ),
    );
  }
}

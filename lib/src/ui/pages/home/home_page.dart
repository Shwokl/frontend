// External imports
import 'package:flutter/material.dart';
import 'package:frontend/src/data/shwokl/workout_plans/workout_plan.dart';

// Local imports
import '../../../data/shwokl/roles/role.dart';
import '../../../data/shwokl/users/user.dart';
import '../../../data/shwokl/workout_logs/workout_log.dart';
import 'views/web_view.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    final User user = User(
      id: 1,
      avatar:
          'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2130&q=80',
      username: 'mike',
      password: 'password',
      spice: 'spice',
      role: Role(id: 2, name: 'User'),
      name: 'Michael Anthony',
    );

    final WorkoutPlan planTemplate = WorkoutPlan(
      id: 1,
      image: 'https://source.unsplash.com/random',
      name: 'My workout plan',
      creator: User(
        name: 'John Doe',
        id: 2,
        password: '',
        role: null,
        spice: '',
        username: 'john.doe',
      ),
    );

    final WorkoutLog a = WorkoutLog(
      id: 1,
      user: null,
      name: '',
      date: DateTime(2021, 1, 10),
    );
    final WorkoutLog b = WorkoutLog(
      id: 1,
      user: null,
      name: '',
      date: DateTime(2021, 1, 12),
    );
    final WorkoutLog c = WorkoutLog(
      id: 1,
      user: null,
      name: '',
      date: DateTime(2021, 1, 13),
    );
    final WorkoutLog d = WorkoutLog(
      id: 1,
      user: null,
      name: '',
      date: DateTime(2021, 1, 17),
    );

    return WebView(
      user: user,
      plans: [
        planTemplate,
        planTemplate,
        planTemplate,
        planTemplate,
        planTemplate,
        planTemplate,
        planTemplate,
        planTemplate,
      ],
      logs: [a, b, c, d],
    );
  }
}

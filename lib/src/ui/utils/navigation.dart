import 'package:flutter/widgets.dart';

void _navigateTo(BuildContext context, String route, Object args) {
  Future.delayed(Duration.zero).then(
    (value) => Navigator.pushNamed(context, route, arguments: args),
  );
}

void _replaceAllWith(BuildContext context, String route, Object args) {
  Future.delayed(Duration.zero).then(
    (value) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
      _navigateTo(context, route, args);
    },
  );
}

void _replaceWith(
  BuildContext context,
  String route,
  Object args,
) {
  Future.delayed(Duration.zero).then(
    (value) => Navigator.pushReplacementNamed(context, route, arguments: args),
  );
}

void navigateToLogin(BuildContext context, {Object args = const {}}) {
  _navigateTo(context, "/login", args);
}

void navigateToSignup(BuildContext context, {Object args = const {}}) {
  _navigateTo(context, "/register", args);
}

void navigateToSettings(BuildContext context, {Object args = const {}}) {
  _navigateTo(context, "/settings", args);
}

void navigateToDashboard(BuildContext context, {Object args = const {}}) {
  _navigateTo(context, "/dashboard", args);
}

void navigateToWorkouts(BuildContext context, {Object args = const {}}) {
  _navigateTo(context, "/workouts", args);
}

void navigateToHistory(BuildContext context, {Object args = const {}}) {
  _navigateTo(context, "/history", args);
}

void resetToDashboard(BuildContext context, {Object args = const {}}) {
  _replaceAllWith(context, "/dashboard", args);
}

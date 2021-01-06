// External imports
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/ui/pages/dashboard/dashboard_page.dart';
import 'package:frontend/src/ui/pages/history/history_page.dart';
import 'package:frontend/src/ui/pages/landing/landing_page.dart';
import 'package:frontend/src/ui/pages/workouts/workouts_page.dart';

// Local imports
import 'bloc/theme/theme_bloc.dart';
import 'ui/pages/login/login_page.dart';
import 'ui/pages/register/register_page.dart';

/// A custom `StatelessWidget` that represents the entrypoint of our app.
///
/// The [ThemeBloc] is implemented via a `BlocProvider` widget.
class ShwoklApp extends StatelessWidget {
  const ShwoklApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(AppTheme.Dark),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  /// Returns a Material app with the theme from [ThemeState.themeData]
  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'Shwokl',
      theme: state.themeData,
      initialRoute: '/',
      debugShowCheckedModeBanner: false, // TODO REMOVE ME
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/workouts': (context) => const WorkoutsPage(),
        '/history': (contents) => const HistoryPage(),
      },
    );
  }
}

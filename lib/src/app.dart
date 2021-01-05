// External imports
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Local imports
import 'bloc/theme/theme_bloc.dart';
import 'ui/pages/home/home_page.dart';
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
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

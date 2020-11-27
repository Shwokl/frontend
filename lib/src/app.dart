import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/ui/home/home_page.dart';

import 'bloc/theme/barrell.dart';
import 'ui/login/login_page.dart';
import 'ui/register/register_page.dart';

class ShwoklApp extends StatelessWidget {
  const ShwoklApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(AppTheme.Dark),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'Shwokl',
      theme: state.themeData,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

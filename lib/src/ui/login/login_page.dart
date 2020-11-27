import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/auth/auth_bloc.dart';
import 'package:frontend/src/widgets/background_pattern.dart';
import 'package:frontend/src/widgets/loading_indicator.dart';

import 'package:frontend/src/widgets/snackbar.dart';

import 'layouts/all.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  Widget _builder(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      return const LoadingIndicator();
    } else if (state is AuthSuccess) {
      Future.delayed(Duration.zero).then(
        (value) => Navigator.pushReplacementNamed(context, "/home"),
      );
      return const BackgroundPattern();
    } else {
      return const StandardLoginLayout();
    }
  }

  void _listener(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      showSnackbar(
        context: context,
        content: "Login Successful",
      );
    } else if (state is AuthFailed) {
      showSnackbar(
        context: context,
        content: "Login Failed",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: _listener,
        builder: _builder,
      ),
    );
  }
}
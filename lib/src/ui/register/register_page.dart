import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/auth/auth_bloc.dart';
import 'package:frontend/src/widgets/background_pattern.dart';
import 'package:frontend/src/widgets/loading_indicator.dart';

import 'package:frontend/src/widgets/snackbar.dart';

import 'layouts/widgets/register_dialog.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  Widget _builder(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      return const LoadingIndicator();
    } else if (state is AuthSuccess) {
      Future.delayed(Duration.zero).then(
        (value) => Navigator.pushReplacementNamed(context, "/login"),
      );
      return const BackgroundPattern();
    } else if (state is AuthFailed || state is AuthInitial) {
      return const RegisterDialog();
    }
    return const SizedBox(width: 1.0, height: 1.0);
  }

  void _listener(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      showSnackbar(
        context: context,
        content: "Register Successful. You can now Log In.",
      );
    } else if (state is AuthFailed) {
      showSnackbar(
        context: context,
        content: "Register Failed",
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

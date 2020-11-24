import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frontend/src/features/_generics_/code/snackbar.dart';
import 'package:frontend/src/generic_widgets/background_pattern.dart';
import 'package:frontend/src/generic_widgets/loading_indicator.dart';

import '../bloc/login_bloc.dart';
import 'widgets/login_dialog.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  Widget _builder(BuildContext context, LoginState state) {
    if (state is LoginLoading) {
      return const LoadingIndicator();
    } else if (state is LoginSuccess) {
      Future.delayed(Duration.zero).then(
        (value) => Navigator.pushReplacementNamed(context, "/home"),
      );
      return BackgroundPattern(opacity: 0.4);
    } else {
      return const LoginDialog();
    }
  }

  void _listener(BuildContext context, LoginState state) {
    if (state is LoginSuccess) {
      showSnackbar(
        context: context,
        content: "Login Successful",
      );
    } else if (state is LoginFail) {
      showSnackbar(
        context: context,
        content: "Login Failed",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: _listener,
        builder: _builder,
      ),
    );
  }
}

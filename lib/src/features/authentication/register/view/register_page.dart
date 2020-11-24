import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frontend/src/features/_generics_/code/snackbar.dart';
import 'package:frontend/src/generic_widgets/background_pattern.dart';
import 'package:frontend/src/generic_widgets/loading_indicator.dart';

import '../bloc/register_bloc.dart';
import 'widgets/register_dialog.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  Widget _builder(BuildContext context, RegisterState state) {
    if (state is RegisterLoading) {
      return const LoadingIndicator();
    } else if (state is RegisterSuccess) {
      Future.delayed(Duration.zero).then(
        (value) => Navigator.pushReplacementNamed(context, "/login"),
      );
      return const BackgroundPattern(opacity: 0.4);
    } else if (state is RegisterFail || state is RegisterInitial) {
      return const RegisterDialog();
    }
    return const SizedBox(width: 1.0, height: 1.0);
  }

  void _listener(BuildContext context, RegisterState state) {
    if (state is RegisterSuccess) {
      showSnackbar(
        context: context,
        content: "Register Successful. You can now Log In.",
      );
    } else if (state is RegisterFail) {
      showSnackbar(
        context: context,
        content: "Register Failed",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: _listener,
        builder: _builder,
      ),
    );
  }
}

// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/snackbar.dart';

// Local imports
import '../../../bloc/auth/auth_bloc.dart';
import '../../widgets/custom_scaffolds/loading_scaffold/loading_indicator.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  Widget _builder(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      return const LoadingIndicator();
    } else if (state is AuthSuccess) {
      Future.delayed(Duration.zero).then(
        (value) => Navigator.pushReplacementNamed(context, "/login"),
      );
      return const BackgroundScaffold();
    } else if (state is AuthFailed || state is AuthInitial) {
      return const LoadingIndicator();
    }
    return const SizedBox(width: 1.0, height: 1.0);
  }

  void _listener(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      showSuccessSnackbar(context,
          title: "Registration successful",
          message:
              "A new user has been successfully created!\nYou can now log in.");
    } else if (state is AuthFailed) {
      showErrorSnackbar(
        context,
        title: "Registration failed",
        message: "Something went wrong during the registration process.",
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

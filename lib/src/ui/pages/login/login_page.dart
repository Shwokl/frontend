// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/loading_scaffold/loading_scaffold.dart';
import 'package:frontend/src/ui/widgets/snackbar.dart';

// Local imports
import '../../../bloc/auth/auth_bloc.dart';
import 'views/web_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  Widget _builder(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      return const LoadingScaffold();
    } else if (state is AuthSuccess) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacementNamed(context, "/dashboard"),
      );
      return const BackgroundScaffold();
    } else {
      return WebView();
    }
  }

  void _listener(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      showSuccessSnackbar(
        context,
        title: "Welcome!",
        message: "Authentication successful!",
      );
    } else if (state is AuthFailed) {
      showErrorSnackbar(
        context,
        title: "Authentication failed!",
        message: "The username and password don't match any registered user.",
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

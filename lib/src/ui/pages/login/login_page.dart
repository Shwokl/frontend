// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Local imports
import '../../../bloc/auth/auth_bloc.dart';
import '../../widgets/background_pattern.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/snackbar.dart';
import 'views/web_view.dart';

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
      return const LoginView();
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

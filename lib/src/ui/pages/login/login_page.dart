// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/loading_scaffold/loading_scaffold.dart';

// Local imports
import '../../../bloc/auth/auth_bloc.dart';
import '../../widgets/snackbar.dart';
import 'views/web_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  Widget _builder(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      return const LoadingScaffold();
    } else if (state is AuthSuccess) {
      Future.delayed(Duration.zero).then(
        (value) => Navigator.pushReplacementNamed(context, "/home"),
      );
      return const BackgroundScaffold();
    } else {
      return WebView();
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

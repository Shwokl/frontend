// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/ui/widgets/snackbar.dart';

// Local imports
import '../../../bloc/auth/auth_bloc.dart';

void navigateToLogin(BuildContext context) {
  Future.delayed(Duration.zero).then(
    (value) => Navigator.pushReplacementNamed(context, "/login"),
  );
}

///
/// [_onRegisterPress] gets called when the Signup button from
/// the form is pressed.
///
/// It checks whether or not the contents of the username, password and email
/// fields are empty and alerts the user via a snackbar if any issues are found.
///
/// If all data is valid, a request is sent to the API server to attempt
/// a register action.
/// Note: The name is not a mandatory field
/// This is implemented via the authentication BLoC.
/// The BLoC states are handled in the login_page.dart/_builder function.
///
void sendSignupEvent(
  BuildContext context, {
  @required String username,
  @required String password,
  @required String email,
  String name = "",
}) {
  if (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {
    BlocProvider.of<AuthBloc>(context).add(SignupEvent(
      name: name,
      username: username,
      email: email,
      password: password,
    ));
  } else {
    showWarningSnackbar(
      context,
      title: "Oops...",
      message:
          "The username, password and email fields are required.\nPlease consider filling them in!",
    );
  }
}

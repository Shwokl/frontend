// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/auth/auth_bloc.dart';
import 'package:frontend/src/ui/widgets/snackbar.dart';

// Local imports

/// Replaces the current view and navigates to the signup form.
///
/// This function gets called when the Signup button from the banner is pressed.
void navigateToSignup(BuildContext context) {
  Future.delayed(Duration.zero).then(
    (value) => Navigator.pushReplacementNamed(context, "/register"),
  );
}

/// Places a [LoginEvent] in the stream of the [AuthBloc].
///
/// This function gets called when the Login button from the form is pressed.
///
/// It checks whether or not the contents of the [username] and [password]
/// fields are empty and alerts the user via a `snackbar` if any
/// issues are found.
/// If all data is valid, a request is sent to the API server to attempt
/// a login action.
void sendLoginEvent(
  BuildContext context, {
  @required String username,
  @required String password,
}) {
  if (username.isNotEmpty && password.isNotEmpty) {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(
        password: password,
        username: username,
      ),
    );
  } else {
    showWarningSnackbar(
      context,
      title: "Please fill all required fields!",
      message: "We can't log you in without a username and password... can we?",
    );
  }
}
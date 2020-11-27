import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/auth/auth_bloc.dart';
import 'package:frontend/src/widgets/snackbar.dart';

///
/// [navigateToSignup] gets called when the Signup button from
/// the banner is pressed.
///
/// It pushes a replacement for the current view and navigates
/// to the signup form.
///
void navigateToSignup(BuildContext context) {
  Future.delayed(Duration.zero).then(
    (value) => Navigator.pushReplacementNamed(context, "/register"),
  );
}

///
/// [sendLoginEvent] gets called when the Login button from
/// the form is pressed.
///
/// It checks whether or not the contents of the username and password
/// fields are empty and alerts the user via a snackbar if any
/// issues are found.
///
/// If all data is valid, a request is sent to the API server to attempt
/// a login action.
/// This is implemented via the authentication BLoC.
/// The BLoC states are handled in the login_page.dart/_builder function.
///
void sendLoginEvent(
  BuildContext context, {
  @required String username,
  @required String password,
}) {
  if (username.isNotEmpty && password.isNotEmpty) {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
      password: password,
      username: username,
    ));
  } else {
    showSnackbar(
      context: context,
      content: 'Username and password cannot be blank!',
    );
  }
}

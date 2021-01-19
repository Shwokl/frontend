// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Local imports
import '../../../../../../bloc/auth/auth_bloc.dart';
import '../../../../../widgets/snackbar.dart';

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
  @required bool rememberMe,
}) {
  if (username.isNotEmpty && password.isNotEmpty) {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(
        password: password,
        username: username,
        rememberMe: rememberMe,
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

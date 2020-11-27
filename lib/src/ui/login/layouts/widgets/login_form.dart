import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/auth/auth_bloc.dart';

import 'package:frontend/src/widgets/buttons/big_ass_button.dart';
import 'package:frontend/src/widgets/buttons/wide_ass_button.dart';
import 'package:frontend/src/widgets/dialogs/elements/scrollable_form.dart';
import 'package:frontend/src/widgets/input_fields/name_input.dart';
import 'package:frontend/src/widgets/input_fields/password_input.dart';

import 'package:frontend/src/widgets/snackbar.dart';

class LoginForm extends StatelessWidget {
  /// Controllers to be able to read the contents of the input fields
  /// from the form.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final bool showSignup;
  LoginForm({this.showSignup = false}); // default constructor

  /// [_onLoginPress] gets triggered when the CTA button from
  /// the form was pressed.
  ///
  /// It checks whether or not the contents of the username and password
  /// fields are empty via their respective TextEditingController and
  /// alerts the user via a snackbar if any issues are found.
  ///
  /// If all data is valid, a request is sent to the API server to attempt
  /// a login action.
  /// This is implemented via the authentication BLoC.
  /// The BLoC states are handled in the login_page.dart/_builder function.
  void _onLoginPress(BuildContext context) {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<AuthBloc>(context).add(LoginEvent(
        password: _passwordController.text,
        username: _usernameController.text,
      ));
    } else {
      showSnackbar(
        context: context,
        content: 'Username and password cannot be blank!',
      );
    }
  }

  void _onSignupPress(BuildContext context) {
    Future.delayed(Duration.zero).then(
      (value) => Navigator.pushReplacementNamed(context, "/register"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableForm(
      title: "Welcome back",
      fields: {
        UserNameInputFiled(_usernameController),
        PasswordInputField(_passwordController),
      },
      callToAction: showSignup
          ? Column(
              children: [
                BigAssButton(
                  prompt: "Log In",
                  onPress: () => _onLoginPress(context),
                ),
                const SizedBox(height: 8.0),
                const Text("or"),
                const SizedBox(height: 8.0),
                WideAssButton(
                  onPress: () => _onSignupPress(context),
                  text: "Sign Up",
                ),
              ],
            )
          : BigAssButton(
              prompt: "Log In",
              onPress: () => _onLoginPress(context),
            ),
    );
  }
}

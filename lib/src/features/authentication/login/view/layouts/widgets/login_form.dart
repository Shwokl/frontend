import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frontend/src/features/_generics_/code/snackbar.dart';
import 'package:frontend/src/features/authentication/login/bloc/login_bloc.dart';

import 'package:frontend/src/generic_widgets/buttons/big_ass_button.dart';
import 'package:frontend/src/generic_widgets/scrollable_form.dart';
import 'package:frontend/src/generic_widgets/input_fields/name_input.dart';
import 'package:frontend/src/generic_widgets/input_fields/password_input.dart';

class LoginForm extends StatelessWidget {
  /// Controllers to be abole to read the contents of the input fields
  /// from the form.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm(); // default constructor

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
      BlocProvider.of<LoginBloc>(context).add(LoginEvent(
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

  @override
  Widget build(BuildContext context) {
    return ScrollableForm(
      title: "Welcome back",
      fields: {
        UserNameInputFiled(_usernameController),
        PasswordInputField(_passwordController),
      },
      callToAction: BigAssButton(
        prompt: "Log In",
        onPress: () => _onLoginPress(context),
      ),
    );
  }
}

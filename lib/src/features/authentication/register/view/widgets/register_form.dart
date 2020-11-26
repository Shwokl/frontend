import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frontend/src/features/_generics_/code/snackbar.dart';
import 'package:frontend/src/features/authentication/register/bloc/register_bloc.dart';

import 'package:frontend/src/generic_widgets/buttons/big_ass_button.dart';
import 'package:frontend/src/generic_widgets/input_fields/email_input.dart';
import 'package:frontend/src/generic_widgets/input_fields/name_input.dart';
import 'package:frontend/src/generic_widgets/input_fields/password_input.dart';
import 'package:frontend/src/generic_widgets/scrollable_form.dart';

class RegisterForm extends StatelessWidget {
  /// Controllers to be abole to read the contents of the input fields
  /// from the form.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterForm(); // default constructor

  /// [_onRegisterPress] gets triggered when the CTA button from
  /// the form was pressed.
  ///
  /// It checks whether or not the contents of the username, password and email
  /// fields are empty via their respective TextEditingController and
  /// alerts the user via a snackbar if any issues are found.
  ///
  /// If all data is valid, a request is sent to the API server to attempt
  /// a register action.
  /// Note: The name is not a mandatory field
  /// This is implemented via the authentication BLoC.
  /// The BLoC states are handled in the login_page.dart/_builder function.
  void _onRegisterPress(BuildContext context) {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      BlocProvider.of<RegisterBloc>(context).add(RegisterEvent(
        name: _nameController.text,
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ));
    } else {
      showSnackbar(
        context: context,
        content: 'Username, password and email cannot be blank!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableForm(
      title: "Let's get you set up",
      fields: {
        NameInputFiled(_nameController),
        UserNameInputFiled(_usernameController),
        EmailInputFiled(_emailController),
        PasswordInputField(_passwordController),
      },
      callToAction: BigAssButton(
        prompt: "Sign Up",
        onPress: () => _onRegisterPress(context),
      ),
    );
  }
}

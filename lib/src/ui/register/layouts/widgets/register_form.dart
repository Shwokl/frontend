import 'package:flutter/material.dart';
import 'package:frontend/src/ui/register/layouts/functions.dart';
import 'package:frontend/src/widgets/buttons/big_ass_button.dart';
import 'package:frontend/src/widgets/dialogs/elements/scrollable_form.dart';
import 'package:frontend/src/widgets/input_fields/email_input.dart';
import 'package:frontend/src/widgets/input_fields/name_input.dart';
import 'package:frontend/src/widgets/input_fields/password_input.dart';

class RegisterForm extends StatelessWidget {
  /// Controllers to be abole to read the contents of the input fields
  /// from the form.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterForm(); // default constructor

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
        onPress: () => sendSignupEvent(
          context,
          username: _usernameController.text,
          password: _passwordController.text,
          email: _emailController.text,
          name: _nameController.text,
        ),
      ),
    );
  }
}

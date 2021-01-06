import 'package:flutter/material.dart';
import 'package:frontend/src/ui/widgets/dialogs/generic_dialog.dart';
import 'package:frontend/src/ui/widgets/dialogs/login_dialog/functions.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/pill_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/wide_flat_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/custom_checkbox.dart';
import 'package:frontend/src/ui/widgets/input_fields/text_input/name_input.dart';
import 'package:frontend/src/ui/widgets/input_fields/text_input/password_input.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog();

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool shouldRemember = false;

  void onLoginPress() {
    sendLoginEvent(
      context,
      username: _usernameController.text,
      password: _passwordController.text,
    );
    // TODO: if shouldRemember, save access token to cookies
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: "Welcome back",
      width: 475,
      children: [
        NameInputFiled(controller: _usernameController, width: 375),
        const SizedBox(height: 32),
        PasswordInputField(controller: _passwordController, width: 375),
        const SizedBox(height: 8),
        TextCheckbox(
          text: "Remember me",
          width: 200,
          isChecked: shouldRemember,
          onCheckedChanged: () {
            shouldRemember = !shouldRemember;
          },
        ),
        const SizedBox(height: 16),
        PillButton(text: "Log in", onPressed: onLoginPress),
        const SizedBox(height: 16),
        Text(
          "Don't have an account?",
          style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontSize: 14,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w200,
          ),
        ),
        WideFlatButton(
          text: "Sign up",
          onPressed: () => navigateToSignup(context),
        ),
      ],
    );
  }
}

// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Local imports
import '../../../../../../bloc/auth/auth_bloc.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/dialogs/generic_dialog.dart';
import '../../../../../widgets/input_fields/buttons/generic/pill_button.dart';
import '../../../../../widgets/input_fields/buttons/generic/wide_flat_button.dart';
import '../../../../../widgets/input_fields/custom_checkbox.dart';
import '../../../../../widgets/input_fields/text_input/name_input.dart';
import '../../../../../widgets/input_fields/text_input/password_input.dart';
import '../../../../../widgets/snackbar.dart';

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
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginEvent(
            password: password, username: username, rememberMe: shouldRemember),
      );
    } else {
      showWarningSnackbar(
        context,
        title: "Please fill all required fields!",
        message:
            "We can't log you in without a username and password... can we?",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: 'Welcome back',
      width: 475,
      height: 515,
      children: [
        UserNameInputFiled(controller: _usernameController, width: 375),
        const SizedBox(height: 32),
        PasswordInputField(controller: _passwordController, width: 375),
        const SizedBox(height: 8),
        TextCheckbox(
          text: 'Remember me',
          width: 200,
          isChecked: shouldRemember,
          onCheckedChanged: () {
            shouldRemember = !shouldRemember;
          },
        ),
        const SizedBox(height: 16),
        PillButton(text: 'Log in', onPressed: onLoginPress),
        const SizedBox(height: 16),
        const StealthyBottomText('Don`t have an account?'),
        WideFlatButton(
          text: 'Sign up',
          onPressed: () => navigateToSignup(context),
          scale: 1,
        ),
      ],
    );
  }
}

// External imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Local imports
import '../../../../../../bloc/auth/auth_bloc.dart';
import '../../../../../../ui/utils/navigation.dart';
import '../../../../../../ui/widgets/dialogs/generic_dialog.dart';
import '../../../../../../ui/widgets/input_fields/buttons/generic/pill_button.dart';
import '../../../../../../ui/widgets/input_fields/buttons/generic/wide_flat_button.dart';
import '../../../../../../ui/widgets/input_fields/text_input/email_input.dart';
import '../../../../../../ui/widgets/input_fields/text_input/name_input.dart';
import '../../../../../../ui/widgets/input_fields/text_input/password_input.dart';
import '../../../../../../ui/widgets/snackbar.dart';
import 'sub_text.dart';

class RegisterDialog extends StatefulWidget {
  const RegisterDialog();

  @override
  _RegisterDialogState createState() => _RegisterDialogState();
}

class _RegisterDialogState extends State<RegisterDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();

  void onSignupPress() {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String username = _usernameController.text;
    final String password = _passController.text;
    final String rePassword = _repassController.text;

    if (username.isEmpty || password.isEmpty || rePassword.isEmpty) {
      showWarningSnackbar(
        context,
        title: 'Please fill in all required fields!',
        message:
            'The username, password and email fields are required.\nPlease consider filling them in!',
      );
    } else {
      if (password != rePassword) {
        showWarningSnackbar(
          context,
          title: 'Invalid password!',
          message: 'Passwords do not match.\nSomeone must have made a typo!',
        );
      } else {
        BlocProvider.of<AuthBloc>(context).add(SignupEvent(
            name: name, username: username, email: email, password: password));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: 'Let`s get you set up',
      width: 475,
      children: [
        NameInputFiled(controller: _nameController, width: 375),
        const SubText('To whom do we owe the honor?'),
        const SizedBox(height: 32),
        EmailInputFiled(controller: _emailController, width: 375),
        const SubText('How can we contact you in the case of an emergency?'),
        const SizedBox(height: 32),
        UserNameInputFiled(controller: _usernameController, width: 375),
        const SubText('What should we call you?'),
        const SizedBox(height: 32),
        PasswordInputField(controller: _passController, width: 375),
        const SubText('Try not to forget it!'),
        const SizedBox(height: 32),
        ConfirmPasswordInputField(controller: _repassController, width: 375),
        const SizedBox(height: 32),
        PillButton(text: 'Create account', onPressed: onSignupPress),
        const SizedBox(height: 16),
        const StealthyBottomText('Already a member?'),
        WideFlatButton(
          text: 'Log in',
          onPressed: () => navigateToLogin(context),
          scale: 1,
        ),
      ],
    );
  }
}

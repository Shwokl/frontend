// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../../../ui/pages/authentication/register/views/register_dialog/functions.dart';
import '../../../../../../ui/utils/navigation.dart';
import '../../../../../../ui/widgets/dialogs/generic_dialog.dart';
import '../../../../../../ui/widgets/input_fields/buttons/pill_button.dart';
import '../../../../../../ui/widgets/input_fields/buttons/wide_flat_button.dart';
import '../../../../../../ui/widgets/input_fields/text_input/email_input.dart';
import '../../../../../../ui/widgets/input_fields/text_input/name_input.dart';
import '../../../../../../ui/widgets/input_fields/text_input/password_input.dart';
import '../../../../../../ui/widgets/snackbar.dart';

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

  void onCreateAccPress() {
    if (_emailController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passController.text.isEmpty ||
        _repassController.text.isEmpty) {
      showWarningSnackbar(
        context,
        title: "Please fill in all required fields!",
        message:
            "The bare minimum we need to set you up is:\n    - a username, so we know who to address,\n    - a valid e-mail address, so you can recover your password in case you forget it,\n    - a valid password.\nYou can keep your name a secret, if you so desire.",
      );
      return;
    }
    if (_passController.text != _repassController.text) {
      showWarningSnackbar(
        context,
        title: "Invalid password!",
        message: "Passwords don't match.\nSomeone must've made a typo!",
      );
      return;
    }
    sendSignupEvent(
      context,
      name: _nameController.text,
      username: _usernameController.text,
      password: _passController.text,
      email: _emailController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: "Let's get you set up",
      width: 475,
      children: [
        NameInputFiled(controller: _nameController, width: 375),
        const SubText("To whom do we owe the honor?"),
        const SizedBox(height: 32),
        EmailInputFiled(controller: _emailController, width: 375),
        const SubText("How can we contact you in the case of an emergency?"),
        const SizedBox(height: 32),
        UserNameInputFiled(controller: _usernameController, width: 375),
        const SubText("What should we call you?"),
        const SizedBox(height: 32),
        PasswordInputField(controller: _passController, width: 375),
        const SubText("Try not to forget it!"),
        const SizedBox(height: 32),
        ConfirmPasswordInputField(controller: _repassController, width: 375),
        const SizedBox(height: 32),
        PillButton(text: "Create account", onPressed: onCreateAccPress),
        const SizedBox(height: 16),
        const StealthyBottomText("Already a member?"),
        WideFlatButton(
          text: "Log in",
          onPressed: () => navigateToLogin(context),
        ),
      ],
    );
  }
}

class SubText extends StatelessWidget {
  final String text;
  const SubText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}

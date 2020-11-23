import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/buttons/big_ass_button.dart';
import 'package:frontend/src/generic_widgets/input_fields/email_input.dart';
import 'package:frontend/src/generic_widgets/input_fields/name_input.dart';
import 'package:frontend/src/generic_widgets/input_fields/password_input.dart';

class RegisterForm extends StatefulWidget {
  final int flex;
  const RegisterForm({@required this.flex});

  @override
  _RegisterFormState createState() => _RegisterFormState(flex);
}

class _RegisterFormState extends State<RegisterForm> {
  int flex;
  final String formTitle = "Let's get you set up";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _RegisterFormState(this.flex);

  void _onRegisterPress() {
    // TODO auth bloc -> Register
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Container(), flex: 3),
            Text(formTitle, style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 48.0),
            NameInputFiled(
              controller: _nameController,
              label: "Full name",
              icon: Icons.person,
            ),
            const SizedBox(height: 24.0),
            NameInputFiled(
              controller: _usernameController,
              label: "Username",
              icon: Icons.fingerprint,
            ),
            const SizedBox(height: 24.0),
            EmailInputFiled(controller: _emailController),
            const SizedBox(height: 24.0),
            PasswordInputField(controller: _passwordController),
            const SizedBox(height: 48.0),
            BigAssButton(prompt: "Sign Up", onPress: _onRegisterPress),
            Expanded(child: Container(), flex: 3),
          ],
        ),
      ),
    );
  }
}

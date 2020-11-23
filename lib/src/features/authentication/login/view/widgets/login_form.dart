import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/buttons/big_ass_button.dart';
import 'package:frontend/src/generic_widgets/input_fields/name_input.dart';
import 'package:frontend/src/generic_widgets/input_fields/password_input.dart';

class LoginForm extends StatefulWidget {
  final int flex;
  const LoginForm({@required this.flex});

  @override
  _LoginFormState createState() => _LoginFormState(flex);
}

class _LoginFormState extends State<LoginForm> {
  int flex;
  final String formTitle = "Welcome back";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _LoginFormState(this.flex);

  void onLoginPress() {
    // TODO auth bloc -> Login
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
            Expanded(child: Container()),
            Text(formTitle, style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 48.0),
            NameInputFiled(
              controller: _usernameController,
              label: "Username or Email",
              icon: Icons.person,
            ),
            const SizedBox(height: 24.0),
            PasswordInputField(controller: _passwordController),
            const SizedBox(height: 48.0),
            BigAssButton(prompt: "Log In", onPress: onLoginPress),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
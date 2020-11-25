import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/_generics_/code/snackbar.dart';
import 'package:frontend/src/features/authentication/login/bloc/login_bloc.dart';
import 'package:frontend/src/generic_widgets/buttons/big_ass_button.dart';
import 'package:frontend/src/generic_widgets/input_fields/name_input.dart';
import 'package:frontend/src/generic_widgets/input_fields/password_input.dart';

class LoginForm extends StatefulWidget {
  final int flex;
  const LoginForm({@required this.flex});

  @override
  // ignore: no_logic_in_create_state
  _LoginFormState createState() => _LoginFormState(flex);
}

class _LoginFormState extends State<LoginForm> {
  int flex;
  final String formTitle = "Welcome back";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _LoginFormState(this.flex);

  void onLoginPress(BuildContext context) {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<LoginBloc>(context).add(LoginEvent(
        password: _passwordController.text,
        username: _usernameController.text,
      ));
    } else {
      showSnackbar(
          context: context, content: 'Username and password cannot be blank!');
    }
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
          borderRadius: const BorderRadius.only(
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
            BigAssButton(
              prompt: "Log In",
              onPress: () => onLoginPress(context),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/buttons/wide_ass_button.dart';

class LoginBanner extends StatelessWidget {
  final int flex;
  const LoginBanner({@required this.flex});

  void _onSignupPress(BuildContext context) {
    Future.delayed(Duration.zero).then(
      (value) => Navigator.pushReplacementNamed(context, "/register"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 4.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            bottomLeft: Radius.circular(32.0),
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Container()),
            Image.asset('lib/src/assets/welcome.png'),
            Expanded(child: Container()),
            Text("Not a member?"),
            const SizedBox(height: 8.0),
            WideAssButton(
              text: "Sign Up",
              onPress: () => _onSignupPress(context),
            ),
          ],
        ),
      ),
    );
  }
}

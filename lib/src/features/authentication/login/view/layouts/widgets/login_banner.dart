import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/buttons/wide_ass_button.dart';
import 'package:frontend/src/generic_widgets/dialog_banner.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner();

  void _onSignupPress(BuildContext context) {
    Future.delayed(Duration.zero).then(
      (value) => Navigator.pushReplacementNamed(context, "/register"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DialogBanner(
      imageSrc: 'lib/src/assets/welcome.png',
      prompt: "Not a member?",
      button: WideAssButton(
        text: "Sign Up",
        onPress: () => _onSignupPress(context),
      ),
    );
  }
}

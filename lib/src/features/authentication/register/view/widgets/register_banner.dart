import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/buttons/wide_ass_button.dart';
import 'package:frontend/src/generic_widgets/dialog_banner.dart';

class RegisterBanner extends StatelessWidget {
  const RegisterBanner();

  void _onLoginPress(BuildContext context) {
    Future.delayed(Duration.zero).then(
      (value) => Navigator.pushReplacementNamed(context, "/login"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DialogBanner(
      imageSrc: 'lib/src/assets/plan.png',
      prompt: "Already a member?",
      button: WideAssButton(
        text: "Sign Up",
        onPress: () => _onLoginPress(context),
      ),
    );
  }
}

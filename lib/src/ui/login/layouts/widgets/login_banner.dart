import 'package:flutter/material.dart';
import 'package:frontend/src/widgets/buttons/wide_ass_button.dart';
import 'package:frontend/src/widgets/dialogs/elements/dialog_banner.dart';

class LoginBanner extends StatelessWidget {
  final bool showImage;
  const LoginBanner({this.showImage = true});

  void _onSignupPress(BuildContext context) {
    Future.delayed(Duration.zero).then(
      (value) => Navigator.pushReplacementNamed(context, "/register"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DialogBanner(
      imageSrc: showImage ? "lib/src/assets/welcome.png" : "",
      prompt: "Not a member?",
      button: WideAssButton(
        text: "Sign Up",
        onPress: () => _onSignupPress(context),
      ),
    );
  }
}

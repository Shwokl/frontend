import 'package:flutter/material.dart';
import 'package:frontend/src/ui/register/layouts/functions.dart';
import 'package:frontend/src/widgets/buttons/wide_ass_button.dart';
import 'package:frontend/src/widgets/dialogs/elements/dialog_banner.dart';

class RegisterBanner extends StatelessWidget {
  const RegisterBanner();


  @override
  Widget build(BuildContext context) {
    return DialogBanner(
      imageSrc: 'lib/src/assets/plan.png',
      prompt: "Already a member?",
      button: WideAssButton(
        text: "Log In",
        onPress: () => navigateToLogin(context),
      ),
    );
  }
}

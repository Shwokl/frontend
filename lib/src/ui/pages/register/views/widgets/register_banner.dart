// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../widgets/buttons/wide_ass_button.dart';
import '../../../../widgets/dialogs/elements/dialog_banner.dart';
import '../../functions.dart';

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

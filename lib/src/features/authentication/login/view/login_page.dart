import 'package:flutter/material.dart';

import 'package:frontend/src/features/authentication/login/view/widgets/login_banner.dart';
import 'package:frontend/src/generic_widgets/background_pattern.dart';
import 'package:frontend/src/generic_widgets/banner_form_dialog.dart';
import 'package:frontend/src/features/authentication/login/view/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundPattern(opacity: 0.35),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 120.0,
              vertical: 60.0,
            ),
            child: BannerFormDialog(
              banner: LoginBanner(flex: 2),
              form: LoginForm(flex: 3),
            ),
          )
        ],
      ),
    );
  }
}

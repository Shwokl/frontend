import 'package:flutter/material.dart';

import 'package:frontend/src/generic_widgets/background_pattern.dart';
import 'package:frontend/src/generic_widgets/banner_form_dialog.dart';

import 'login_banner.dart';
import 'login_form.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundPattern(opacity: 0.4),
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

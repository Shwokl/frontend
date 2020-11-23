import 'package:flutter/material.dart';

import 'package:frontend/src/features/authentication/register/view/widgets/register_banner.dart';
import 'package:frontend/src/features/authentication/register/view/widgets/register_form.dart';
import 'package:frontend/src/generic_widgets/background_pattern.dart';
import 'package:frontend/src/generic_widgets/banner_form_dialog.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).brightness);
    return Scaffold(
      backgroundColor: Colors.black,
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
              banner: RegisterBanner(flex: 2),
              form: RegisterForm(flex: 3),
            ),
          )
        ],
      ),
    );
  }
}

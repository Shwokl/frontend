// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../widgets/background_pattern.dart';
import '../../../../widgets/dialogs/banner_form_dialog.dart';
import 'register_banner.dart';
import 'register_form.dart';

class RegisterDialog extends StatelessWidget {
  const RegisterDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPattern(),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 120.0,
              vertical: 60.0,
            ),
            child: BannerFormDialog(
              banner: const Expanded(flex: 2, child: RegisterBanner()),
              form: Expanded(flex: 3, child: RegisterForm()),
            ),
          )
        ],
      ),
    );
  }
}

// External imports
import 'package:flutter/material.dart';

// Local imposrts
import '../../../widgets/background_pattern.dart';
import '../../../widgets/dialogs/banner_form_dialog.dart';
import 'widgets/login_banner.dart';
import 'widgets/login_form.dart';

///
/// [LoginView] is the layout that should be displayed on desktop browsers
/// or tablets, when we are not 'restricted' in terms of vertical or horizontal
/// space
///
class LoginView extends StatelessWidget {
  const LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPattern(),
          Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(horizontal: 120.0, vertical: 60.0),
            child: BannerFormDialog(
              banner: const Expanded(flex: 2, child: LoginBanner()),
              form: Expanded(flex: 3, child: LoginForm()),
            ),
          )
        ],
      ),
    );
  }
}

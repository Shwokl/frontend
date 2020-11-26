import 'package:flutter/material.dart';

import 'package:frontend/src/generic_widgets/background_pattern.dart';
import 'package:frontend/src/generic_widgets/banner_form_dialog.dart';

import 'widgets/all.dart';

///
/// [StandardLoginLayout] is the layout that should be displayed on desktop browsers
/// or tablets, when we are not 'restricted' in terms of vertical or horizontal
/// space
///
class StandardLoginLayout extends StatelessWidget {
  const StandardLoginLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPattern(opacity: 0.4),
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

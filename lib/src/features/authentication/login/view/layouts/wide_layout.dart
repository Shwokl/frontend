import 'package:flutter/material.dart';

import 'package:frontend/src/generic_widgets/background_pattern.dart';
import 'package:frontend/src/generic_widgets/banner_form_dialog.dart';

import 'widgets/all.dart';

///
/// [WideLoginLayout] is the layout that should be displayed on mobile devices
/// (landscape orientation) or browsers that are resized to be less tall than
/// the StandardLayout would require.
/// This layout is used when we are restricted in terms of vertical space
///
class WideLoginLayout extends StatelessWidget {
  const WideLoginLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPattern(opacity: 0.4),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            child: BannerFormDialog(
              banner: const Expanded(
                flex: 2,
                child: LoginBanner(showImage: false),
              ),
              form: Expanded(flex: 3, child: LoginForm()),
            ),
          )
        ],
      ),
    );
  }
}

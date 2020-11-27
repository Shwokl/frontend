import 'package:flutter/material.dart';
import 'package:frontend/src/widgets/background_pattern.dart';
import 'package:frontend/src/widgets/dialogs/form_dialog.dart';


import 'widgets/all.dart';

///
/// [TallLoginLayout] is the layout that should be displayed on mobile devices
/// (portrait orientation) or browsers that are resized to be less wide than
/// the StandardLayout would require.
/// This layout is used when we are restricted in terms of horizontal space
///
class TallLoginLayout extends StatelessWidget {
  const TallLoginLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPattern(),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: FormDialog(LoginForm(showSignup: true)),
          )
        ],
      ),
    );
  }
}

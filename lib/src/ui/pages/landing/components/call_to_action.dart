// External imports
import 'dart:math';
import 'package:flutter/material.dart';

// Local imports
import '../../../../ui/utils/navigation.dart';
import '../../../../ui/widgets/input_fields/buttons/generic/pill_button.dart';

class CallToAction extends StatelessWidget {
  final String text;
  final double hScale, wScale;
  const CallToAction(this.text, this.hScale, this.wScale);

  @override
  Widget build(BuildContext context) {
    const double minFontSize = 24;
    final double fontSize = 32 * wScale;
    const Size minSize = Size(64, 4);
    final Size size = Size(96 * hScale, 16 * wScale);

    return PillButton(
      text: text,
      onPressed: () => navigateToLogin(context),
      padding: EdgeInsets.symmetric(
        horizontal: max(size.width, minSize.width),
        vertical: max(size.height, minSize.height),
      ),
      fontSize: max(fontSize, minFontSize),
    );
  }
}

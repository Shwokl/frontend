import 'dart:math';

import 'package:flutter/material.dart';

import 'wide_flat_button.dart';

class NavButton extends StatelessWidget {
  final String text;
  final bool isAccent;
  final double scale;
  final VoidCallback onPressed;

  const NavButton({
    @required this.text,
    @required this.onPressed,
    this.scale = 1,
    this.isAccent = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const Size minSize = Size(32, 16);
    final Size size = Size(40 * scale, 24 * scale);

    return WideFlatButton(
      text: text,
      color: isAccent ? theme.accentColor : theme.primaryColorLight,
      padding: EdgeInsets.symmetric(
        vertical: max(minSize.height, size.height),
        horizontal: max(minSize.width, size.width),
      ),
      onPressed: onPressed,
      scale: scale,
    );
  }
}

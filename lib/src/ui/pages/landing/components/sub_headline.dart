import 'dart:math';

import 'package:flutter/material.dart';

class SubHeadline extends StatelessWidget {
  final String text;
  final double scale;
  const SubHeadline(this.text, this.scale);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double minSize = 24;
    final double size = 36 * scale;

    return Text(
      text,
      style: TextStyle(
        fontSize: max(size, minSize),
        letterSpacing: 3,
        fontWeight: FontWeight.w400,
        color: (theme.brightness == Brightness.dark)
            ? theme.primaryColorLight
            : theme.primaryColorDark,
      ),
    );
  }
}

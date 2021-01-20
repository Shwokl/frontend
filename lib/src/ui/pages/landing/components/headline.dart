import 'dart:math';

import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String text;
  final double scale;
  const Headline(this.text, this.scale);

  @override
  Widget build(BuildContext context) {
    const double minSize = 90;
    final double size = 120 * scale;
    return Text(
      text,
      style: TextStyle(
        fontSize: max(size, minSize),
        letterSpacing: 3,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

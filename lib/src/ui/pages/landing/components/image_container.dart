import 'dart:math';

import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String asset;
  final double scale;
  const ImageContainer(this.asset, this.scale);

  @override
  Widget build(BuildContext context) {
    const double minSize = 400;
    final double size = 1500 * scale;

    return SizedBox(
      width: max(size, minSize),
      child: Image.asset(
        "lib/src/assets/success.png",
        width: double.infinity,
      ),
    );
  }
}

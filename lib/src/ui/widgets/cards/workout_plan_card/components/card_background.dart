import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  final String image;
  final double height;
  final BoxFit fit;
  const CardBackground(
    this.image, {
    @required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: NetworkImage(image),
      height: height,
      colorFilter: const ColorFilter.mode(
        Colors.black45,
        BlendMode.darken,
      ),
      fit: fit,
    );
  }
}

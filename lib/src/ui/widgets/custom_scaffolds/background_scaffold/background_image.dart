import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  const BackgroundImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        imagePath,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}

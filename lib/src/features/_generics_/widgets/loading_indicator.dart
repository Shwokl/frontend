import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/background_pattern.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BackgroundPattern(opacity: 0.4),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

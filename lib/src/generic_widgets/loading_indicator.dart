import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/background_pattern.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPattern(opacity: 0.4),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

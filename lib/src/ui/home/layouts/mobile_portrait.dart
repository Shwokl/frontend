import 'package:flutter/material.dart';

class PortraitMobileLayout extends StatelessWidget {
  const PortraitMobileLayout();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Mobile portrait',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

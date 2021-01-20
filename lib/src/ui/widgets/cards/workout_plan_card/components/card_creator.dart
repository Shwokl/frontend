import 'package:flutter/material.dart';

class CardCreator extends StatelessWidget {
  final String name;
  const CardCreator(this.name);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: Text(
        'by $name',
        style: const TextStyle(
          color: Colors.white54,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

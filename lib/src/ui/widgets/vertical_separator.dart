import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  final double height;

  const VerticalSeparator({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 5,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

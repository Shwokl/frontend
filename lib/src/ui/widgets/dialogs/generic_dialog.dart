import 'package:flutter/material.dart';

class GenericDialog extends StatelessWidget {
  final double width, height;
  final EdgeInsets padding;
  final Alignment alignment;

  final String title;
  final List<Widget> children;

  const GenericDialog({
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(48.0),
    this.height,
    this.width,
    @required this.title,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Theme.of(context).primaryColor,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                letterSpacing: 3.5,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32),
            Column(children: children),
          ],
        ),
      ),
    );
  }
}

class StealthyBottomText extends StatelessWidget {
  final String text;
  const StealthyBottomText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).primaryColorLight,
        fontSize: 14,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DialogBanner extends StatelessWidget {
  final String imageSrc;
  final String prompt;
  final Widget button;
  const DialogBanner({
    @required this.button,
    @required this.imageSrc,
    @required this.prompt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 4.0),
      color: Theme.of(context).primaryColorDark,
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Image.asset(imageSrc),
          Expanded(child: Container()),
          Text(prompt),
          const SizedBox(height: 8.0),
          button
        ],
      ),
    );
  }
}
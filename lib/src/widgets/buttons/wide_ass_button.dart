import 'package:flutter/material.dart';

class WideAssButton extends StatelessWidget {
  final void Function() onPress;
  final String text;

  const WideAssButton({
    @required this.onPress,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(
        horizontal: 64.0,
        vertical: 16.0,
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5.copyWith(
              color: Theme.of(context).accentColor,
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BigAssButton extends StatelessWidget {
  final String prompt;
  final void Function() onPress;

  const BigAssButton({
    @required this.prompt,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        prompt,
        style: Theme.of(context).textTheme.headline5.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700
            ),
      ),
      color: Theme.of(context).accentColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 48.0,
        vertical: 16.0,
      ),
      onPressed: onPress,
    );
  }
}

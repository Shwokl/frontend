import 'package:flutter/material.dart';

import 'generic_input.dart';

class EmailInputFiled extends StatelessWidget {
  final TextEditingController controller;
  final double width;

  const EmailInputFiled({
    @required this.controller,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Email",
      width: width,
      controller: controller,
      prefixWidget: Icon(
        Icons.email,
        color: Theme.of(context).accentColor,
      ),
    );
  }
}

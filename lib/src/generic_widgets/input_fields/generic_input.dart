import 'package:flutter/material.dart';

class GenericInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool hideText;
  final Widget prefixWidget;
  final Widget suffixWidget;

  const GenericInputField({
    @required this.label,
    @required this.controller,
    @required this.prefixWidget,
    @required this.suffixWidget,
    @required this.hideText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
      ),
      cursorWidth: 0.75,
      controller: controller,
      obscureText: hideText,
    );
  }
}

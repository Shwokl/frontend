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
    this.prefixWidget = const SizedBox(width: 0, height: 0),
    this.suffixWidget = const SizedBox(width: 0, height: 0),
    this.hideText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixWidget,
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).accentColor),
        suffixIcon: suffixWidget,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
            width: 0.7,
          ),
        ),
      ),
      cursorWidth: 0.75,
      controller: controller,
      obscureText: hideText,
    );
  }
}

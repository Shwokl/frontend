import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/input_fields/generic_input.dart';

class NameInputFiled extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  const NameInputFiled({
    @required this.controller,
    @required this.label,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: label,
      controller: controller,
      prefixWidget: Icon(icon),
      suffixWidget: null,
      hideText: false,
    );
  }
}

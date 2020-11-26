import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/input_fields/generic_input.dart';

class EmailInputFiled extends StatelessWidget {
  final TextEditingController controller;
  const EmailInputFiled(this.controller);

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Email",
      controller: controller,
      prefixWidget: const Icon(Icons.email),
      suffixWidget: null,
      hideText: false,
    );
  }
}

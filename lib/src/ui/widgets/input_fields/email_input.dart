import 'package:flutter/material.dart';

import 'generic_input.dart';


class EmailInputFiled extends StatelessWidget {
  final TextEditingController controller;
  const EmailInputFiled(this.controller);

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Email",
      controller: controller,
      prefixWidget: const Icon(Icons.email),
    );
  }
}

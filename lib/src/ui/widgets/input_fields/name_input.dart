import 'package:flutter/material.dart';

import 'generic_input.dart';

class NameInputFiled extends StatelessWidget {
  final TextEditingController controller;
  const NameInputFiled(this.controller);

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Name",
      controller: controller,
      prefixWidget: const Icon(Icons.person),
    );
  }
}

class UserNameInputFiled extends StatelessWidget {
  final TextEditingController controller;
  const UserNameInputFiled(this.controller);

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Username",
      controller: controller,
      prefixWidget: const Icon(Icons.fingerprint),
    );
  }
}

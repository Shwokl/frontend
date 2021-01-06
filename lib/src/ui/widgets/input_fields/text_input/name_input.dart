import 'package:flutter/material.dart';

import 'generic_input.dart';

class NameInputFiled extends StatelessWidget {
  final TextEditingController controller;
  final double width;

  const NameInputFiled({
    @required this.controller,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Name",
      width: width,
      controller: controller,
      prefixWidget: const Icon(Icons.person),
    );
  }
}

class UserNameInputFiled extends StatelessWidget {
  final TextEditingController controller;
  final double width;

  const UserNameInputFiled({
    @required this.controller,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Username",
      width: width,
      controller: controller,
      prefixWidget: const Icon(Icons.fingerprint),
    );
  }
}

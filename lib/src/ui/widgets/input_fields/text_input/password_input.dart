import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'generic_input.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final double width;

  const PasswordInputField({
    @required this.controller,
    @required this.width,
  });

  @override
  _PasswordInputFieldState createState() =>
      // ignore: no_logic_in_create_state
      _PasswordInputFieldState(controller, width);
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final TextEditingController controller;
  final double width;
  bool _hidePassword = true;

  _PasswordInputFieldState(this.controller, this.width);

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Password",
      width: width,
      controller: controller,
      prefixWidget: const Icon(Icons.lock),
      suffixWidget: IconButton(
        icon: _hidePassword
            ? const Icon(MdiIcons.eyeOff)
            : const Icon(MdiIcons.eye),
        onPressed: () {
          setState(() {
            _hidePassword = !_hidePassword;
          });
        },
      ),
      hideText: _hidePassword,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/src/generic_widgets/input_fields/generic_input.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInputField({this.controller});

  @override
  _PasswordInputFieldState createState() =>
      // ignore: no_logic_in_create_state
      _PasswordInputFieldState(controller);
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final TextEditingController controller;
  bool _hidePassword = true;

  _PasswordInputFieldState(this.controller);

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: "Password",
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

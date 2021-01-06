import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'generic_input.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  const PasswordInputField({
    @required this.controller,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GenericPasswordInputField(
      controller: controller,
      width: width,
      prompt: "Password",
    );
  }
}

class ConfirmPasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  const ConfirmPasswordInputField({
    @required this.controller,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GenericPasswordInputField(
      controller: controller,
      width: width,
      prompt: "Confirm Password",
    );
  }
}

class GenericPasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final double width;
  final String prompt;

  const GenericPasswordInputField({
    @required this.controller,
    @required this.width,
    @required this.prompt,
  });

  @override
  _GenericPasswordInputFieldState createState() =>
      // ignore: no_logic_in_create_state
      _GenericPasswordInputFieldState(controller, width, prompt);
}

class _GenericPasswordInputFieldState extends State<GenericPasswordInputField> {
  final TextEditingController controller;
  final double width;
  final String prompt;
  bool _hidePassword = true;

  _GenericPasswordInputFieldState(this.controller, this.width, this.prompt);

  @override
  Widget build(BuildContext context) {
    return GenericInputField(
      label: prompt,
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

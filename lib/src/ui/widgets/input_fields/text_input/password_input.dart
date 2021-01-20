import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'generic_input.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final double width, scale;
  const PasswordInputField({
    @required this.controller,
    @required this.width,
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GenericPasswordInputField(
      controller: controller,
      width: width,
      prompt: "Password",
      scale: scale,
    );
  }
}

class ConfirmPasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final double width, scale;
  const ConfirmPasswordInputField({
    @required this.controller,
    @required this.width,
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GenericPasswordInputField(
      controller: controller,
      width: width,
      prompt: "Confirm Password",
      scale: scale,
    );
  }
}

class GenericPasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final double width, scale;
  final String prompt;

  const GenericPasswordInputField({
    @required this.controller,
    @required this.width,
    @required this.prompt,
    this.scale = 1,
  });

  @override
  _GenericPasswordInputFieldState createState() =>
      // ignore: no_logic_in_create_state
      _GenericPasswordInputFieldState(controller, width, prompt, scale);
}

class _GenericPasswordInputFieldState extends State<GenericPasswordInputField> {
  final TextEditingController controller;
  final double width, scale;
  final String prompt;
  bool _hidePassword = true;

  _GenericPasswordInputFieldState(
      this.controller, this.width, this.prompt, this.scale);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double minWidth = 80;
    final double actualWidth = width * scale;

    return GenericInputField(
      label: prompt,
      width: max(minWidth, actualWidth),
      controller: controller,
      prefixWidget: Icon(
        Icons.lock,
        color: theme.accentColor,
      ),
      suffixWidget: IconButton(
        icon: _hidePassword
            ? const Icon(MdiIcons.eyeOff)
            : const Icon(MdiIcons.eye),
        color: theme.accentColor,
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

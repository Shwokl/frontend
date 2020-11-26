import 'package:flutter/material.dart';

class FormDialog extends StatelessWidget {
  final Widget form;

  const FormDialog(this.form);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      elevation: 8.0,
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        constraints: const BoxConstraints(
          maxWidth: 1200,
          maxHeight: 650,
        ),
        child: form,
      ),
    );
  }
}

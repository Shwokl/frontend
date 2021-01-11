import 'package:flutter/material.dart';

class TextCheckbox extends StatefulWidget {
  final bool isChecked;
  final String text;
  final double width, height;
  final Function onCheckedChanged;

  const TextCheckbox({
    @required this.isChecked,
    @required this.text,
    this.width = double.infinity,
    this.height = 50,
    this.onCheckedChanged,
  });

  @override
  // ignore: no_logic_in_create_state
  _TextCheckboxState createState() => _TextCheckboxState(
      isChecked: isChecked,
      text: text,
      width: width,
      height: height,
      onCheckedChanged: onCheckedChanged);
}

class _TextCheckboxState extends State<TextCheckbox> {
  bool isChecked;
  String text;
  double width, height;
  Function onCheckedChanged;

  _TextCheckboxState({
    @required this.isChecked,
    @required this.text,
    @required this.width,
    @required this.height,
    @required this.onCheckedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.centerLeft,
      width: width,
      height: height,
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.all(0),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(text),
        value: isChecked,
        onChanged: (newValue) {
          isChecked = newValue;
          onCheckedChanged();
          setState(() {});
        },
      ),
    );
  }
}

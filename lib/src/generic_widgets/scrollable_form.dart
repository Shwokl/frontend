import 'package:flutter/material.dart';

class ScrollableForm extends StatelessWidget {
  final String title;
  final Set<Widget> fields;
  final Widget callToAction;

  const ScrollableForm({
    @required this.title,
    @required this.fields,
    @required this.callToAction,
  });

  @override
  Widget build(BuildContext context) {
    // The widgets that will be laid in the ScrollView
    final List<Widget> inputFields = [];

    // Add title
    inputFields.add(Text(title, style: Theme.of(context).textTheme.headline3));

    // Add whitespace between title and form fields
    inputFields.add(const SizedBox(height: 48.0));

    // Add all form fields with a 24..0 gap between each one
    for (int i = 0; i < fields.length; i++) {
      inputFields.add(fields.elementAt(i));
      inputFields.add(const SizedBox(height: 24.0));
    }

    // Add whitespace between form fields and CTA
    inputFields.add(const SizedBox(height: 24.0));

    // Add CTA
    inputFields.add(callToAction);

    return Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: inputFields),
      ),
    );
  }
}

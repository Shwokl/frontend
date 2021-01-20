// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../../ui/utils/navigation.dart';
import '../../../../../ui/widgets/input_fields/buttons/generic/nav_button.dart';

class LinkButton extends StatelessWidget {
  final String url;
  final String text;
  final double scale;
  const LinkButton(this.text, this.url, this.scale);

  @override
  Widget build(BuildContext context) {
    return NavButton(
      text: text,
      onPressed: () => navigateToURL(url),
      scale: scale,
    );
  }
}

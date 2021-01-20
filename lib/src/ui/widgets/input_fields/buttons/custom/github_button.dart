// External imports
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/src/ui/utils/navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Local imports
import '../generic/pill_button.dart';

class GithubButton extends StatelessWidget {
  final String url;
  final double scale;
  const GithubButton(this.url, {this.scale = 1});

  @override
  Widget build(BuildContext context) {
    final double iconSize = 36 * scale;
    final double vPadding = 8 * scale;
    final double hPadding = 48 * scale;

    final ThemeData theme = Theme.of(context);
    return PillButton(
      text: 'View on GitHub',
      leadingIcon: MdiIcons.github,
      iconSize: iconSize,
      textColor: theme.accentColor,
      fillColor: theme.primaryColor,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      onPressed: () => navigateToURL(url),
      scale: scale,
    );
  }
}

// External imports
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/src/ui/utils/navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Local imports
import '../generic/pill_button.dart';

class GithubButton extends StatefulWidget {
  final String url;
  final double scale;
  const GithubButton(this.url, {this.scale = 1});

  @override
  // ignore: no_logic_in_create_state
  _GithubButtonState createState() => _GithubButtonState(url, scale);
}

class _GithubButtonState extends State<GithubButton> {
  final String url;
  final double scale;
  _GithubButtonState(this.url, this.scale);

  @override
  Widget build(BuildContext context) {
    const double minIconSize = 32;
    const Size minSize = Size(32, 12);
    final double iconSize = 32 * scale;
    final Size size = Size(64 * scale, 16 * scale);

    final ThemeData theme = Theme.of(context);
    return PillButton(
      text: 'View on GitHub',
      leadingIcon: MdiIcons.github,
      iconSize: max(minIconSize, iconSize),
      textColor: theme.accentColor,
      fillColor: theme.primaryColor,
      padding: EdgeInsets.symmetric(
        vertical: max(minSize.height, size.height),
        horizontal: max(minSize.width, size.width),
      ),
      onPressed: () {
        setState(() {
          navigateToURL(url);
        });
      },
    );
  }
}

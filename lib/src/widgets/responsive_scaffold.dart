import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResponsiveScaffold extends StatelessWidget {
  final Widget mobilePortrait;
  final Widget mobileLandscape;
  final Widget desktopPortrait;
  final Widget desktopLandscape;

  const ResponsiveScaffold({
    @required this.mobilePortrait,
    @required this.mobileLandscape,
    @required this.desktopPortrait,
    @required this.desktopLandscape,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (kIsWeb) {
      if (width < 700) {
        return desktopPortrait;
      }
      return desktopLandscape;
    }
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return mobilePortrait;
    }
    return mobileLandscape;
  }
}

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResponsiveScaffold extends StatelessWidget {
  final Widget mobilePortrait;
  final Widget mobileLandscape;
  final Widget tabletPortrait;
  final Widget tabletLandscape;
  final Widget desktopStandard;
  final Widget desktopTall;
  final Widget desktopWide;

  const ResponsiveScaffold({
    @required this.mobilePortrait,
    @required this.mobileLandscape,
    @required this.tabletPortrait,
    @required this.tabletLandscape,
    @required this.desktopStandard,
    @required this.desktopTall,
    @required this.desktopWide,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (Platform.isAndroid || Platform.isIOS) {
      if (orientation == Orientation.portrait) {
        return mobilePortrait;
      } else {
        return mobileLandscape;
      }
    }

    if (kIsWeb) {
      if (width < 400) {
        return desktopTall;
      }
      if (height < 600) {
        return desktopWide;
      }

      return desktopStandard;
    }
    return const SizedBox(width: 0, height: 0);
  }
}

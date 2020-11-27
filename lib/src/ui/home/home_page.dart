import 'package:flutter/material.dart';
import 'package:frontend/src/widgets/responsive_scaffold.dart';

import 'layouts/all.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveScaffold(
      mobilePortrait: PortraitMobileLayout(),
      mobileLandscape: LandscapeMobileLayout(),
      desktopLandscape: LandscapeDesktopLayout(),
      desktopPortrait: PortraitDesktopLayout(),
    );
  }
}

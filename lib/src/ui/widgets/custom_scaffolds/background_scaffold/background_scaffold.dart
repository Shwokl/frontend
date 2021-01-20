// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../ui/widgets/custom_scaffolds/background_scaffold/background_image.dart';
import '../../../../ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget body;
  final CustomAppBar fakeAppBar;
  // ignore: avoid_field_initializers_in_const_classes
  final double _ogWidth = 3072;
  // ignore: avoid_field_initializers_in_const_classes
  final double _ogHeight = 1580;

  const BackgroundScaffold({
    this.body = const SizedBox(width: 0, height: 0),
    this.fakeAppBar = const CustomAppBar(),
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double wScale = width / _ogWidth;
    final double hScale = height / _ogHeight;
    print(//TODO DELETEME
        'Width: $width | Height: $height | WScale: $wScale | HScale: $hScale');

    // Select a different pattern based on theme brightness
    String patternPath = 'lib/src/assets/patterns/memphis-mini/';
    patternPath +=
        (theme.brightness == Brightness.dark) ? 'dark.png' : 'light.png';

    return Stack(children: [
      BackgroundImage(patternPath),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 225 * wScale, vertical: 32 * hScale),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: fakeAppBar,
          body: SafeArea(
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: double.infinity,
              child: body,
            ),
          ),
        ),
      ),
    ]);
  }
}

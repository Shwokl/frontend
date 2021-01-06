import 'package:flutter/material.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_image.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget body;
  final Widget fakeAppBar;

  const BackgroundScaffold({
    this.body = const SizedBox(width: 0, height: 0),
    this.fakeAppBar = const SizedBox(width: 0, height: 0),
  });

  @override
  Widget build(BuildContext context) {
    // Select a different pattern based on theme brightness
    String patternPath = "lib/src/assets/patterns/memphis-mini/";
    if (Theme.of(context).brightness == Brightness.dark) {
      patternPath += "dark.png";
    } else {
      patternPath += "light.png";
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(patternPath),
            Column(children: [fakeAppBar, body]),
          ],
        ),
      ),
    );
  }
}

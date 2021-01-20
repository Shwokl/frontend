// External imports
import 'package:flutter/material.dart';

// Internal imports
import '../../../../widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';

import 'components/register_dialog.dart';

class WebView extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return BackgroundScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (height > 700) const SizedBox(height: 64),
            const Center(child: RegisterDialog()),
          ],
        ),
      ),
    );
  }
}

// External imports
import 'package:flutter/material.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';

import 'login_dialog/login_dialog.dart';

class WebView extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      fakeAppBar: const CustomAppBar(),
      body: Column(
        children: const [
          SizedBox(height: 32),
          LoginDialog(),
        ],
      ),
    );
  }
}

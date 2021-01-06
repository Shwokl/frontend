import 'package:flutter/material.dart';
import 'package:frontend/src/ui/pages/register/views/register_dialog/functions.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/pill_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/theme_button.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/wide_flat_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

Future<void> _navigateToURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      fakeAppBar: CustomAppBar(
        navItems: [
          WideFlatButton(
            text: "Download",
            color: Theme.of(context).primaryColorLight,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            onPressed: () {
              setState(() {
                _navigateToURL("https://google.com");
              });
            },
          ),
          WideFlatButton(
            text: "Docs",
            color: Theme.of(context).primaryColorLight,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            onPressed: () {
              setState(() {
                _navigateToURL("https://google.com");
              });
            },
          ),
          WideFlatButton(
            text: "Contact",
            color: Theme.of(context).primaryColorLight,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            onPressed: () {
              setState(() {
                _navigateToURL("https://google.com");
              });
            },
          ),
        ],
        trailingIcons: [
          PillButton(
            text: "View on GitHub",
            leadingIcon: MdiIcons.github,
            iconSize: 32.0,
            textColor: Theme.of(context).accentColor,
            fillColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 64.0,
            ),
            onPressed: () {
              setState(() {
                _navigateToURL("https://github.com/mikeanth-dev/Shwokl");
              });
            },
          ),
          const ThemeButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Self hosted workout log",
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                const Text(
                  "Your workouts.\nYour progress.\nYOUR data.",
                  style: TextStyle(
                    fontSize: 120,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 32.0),
                PillButton(
                  text: "Take me to login",
                  onPressed: () => navigateToLogin(context),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 96.0,
                    vertical: 16.0,
                  ),
                  fontSize: 32,
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              "lib/src/assets/success.png",
              width: 1200,
            ),
          ],
        ),
      ),
    );
  }
}

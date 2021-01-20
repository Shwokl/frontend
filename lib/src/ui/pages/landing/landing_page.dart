// External imports
import 'package:flutter/material.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/custom_appbar/appbar_title.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/custom/link_button.dart';

// Local imports
import '../../../ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import '../../../ui/widgets/custom_scaffolds/custom_appbar/custom_appbar.dart';
import '../../../ui/widgets/input_fields/buttons/custom/github_button.dart';
import '../../../ui/widgets/input_fields/buttons/custom/theme_button.dart';
import 'components/all.dart';

class LandingPage extends StatefulWidget {
  const LandingPage();

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final double _ogWidth = 3072;
  final double _ogHeight = 1580;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double wScale = width / _ogWidth;
    final double hScale = height / _ogHeight;

    return BackgroundScaffold(
      fakeAppBar: CustomAppBar(
        logo: AppbarTitle(scale: wScale),
        navItems: [
          LinkButton(
              'Download', 'https://github.com/orgs/Shwokl/packages', wScale),
          LinkButton('Docs', 'https://github.com/Shwokl/wiki', wScale),
          LinkButton('Contact', 'https://github.com/mikeanth-dev', wScale),
        ],
        trailingIcons: [
          if (width > 1250) const GithubButton('https://github.com/Shwokl'),
          if (width > 850) const ThemeButton(),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubHeadline('Self hosted workout log.', wScale),
                  Headline(
                      'Your workouts.\nYour progress.\nYOUR data.', wScale),
                  SizedBox(height: 32.0 * wScale),
                  CallToAction('Take me to login', hScale, wScale),
                ],
              ),
              const Expanded(child: SizedBox()),
              if (MediaQuery.of(context).size.width > 1500)
                ImageContainer('lib/src/assets/success.png', wScale),
            ],
          ),
        ),
      ),
    );
  }
}

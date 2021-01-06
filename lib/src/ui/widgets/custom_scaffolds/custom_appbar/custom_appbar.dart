import 'package:flutter/material.dart';
import 'package:frontend/src/ui/widgets/input_fields/buttons/theme_button.dart';
import 'package:frontend/src/ui/widgets/vertical_separator.dart';

import 'appbar_title.dart';

class CustomAppBar extends StatelessWidget {
  final Widget logo;
  final List<Widget> trailingIcons;
  final List<Widget> navItems;

  const CustomAppBar({
    this.logo = const AppbarTitle(),
    this.trailingIcons = const [ThemeButton()],
    this.navItems = const [],
  });

  void navigateTo(BuildContext context, String path) {
    Future.delayed(Duration.zero).then(
      (value) => Navigator.pushNamed(context, path),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> elements = [logo]; // Add the logo as the leftmost item

    // Add some padding between the logo and the separator
    elements.add(const SizedBox(width: 24));

    elements.add(const VerticalSeparator(height: 32));

    // Add some padding between the separator and the nav items
    elements.add(const SizedBox(width: 24));

    // Add all nav items
    elements.addAll(navItems);

    // Right allign the trailing icons
    elements.add(const Expanded(child: SizedBox()));

    // Add all trailing icons to the elements list
    elements.addAll(trailingIcons);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(225, 50, 225, 25),
      child: Row(children: elements),
    );
  }
}

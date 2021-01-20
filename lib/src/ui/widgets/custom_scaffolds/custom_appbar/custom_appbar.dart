// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../ui/widgets/input_fields/buttons/custom/theme_button.dart';
import '../../../../ui/widgets/vertical_separator.dart';
import 'appbar_title.dart';

class CustomAppBar extends PreferredSize {
  final Widget logo;
  final List<Widget> trailingIcons;
  final List<Widget> navItems;

  const CustomAppBar({
    this.logo = const AppbarTitle(),
    this.trailingIcons = const [ThemeButton()],
    this.navItems = const [],
  });

  @override
  Size get preferredSize => const Size.fromHeight(128);

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
    // ignore: avoid_function_literals_in_foreach_calls
    trailingIcons.forEach((e) {
      elements.add(e);
      elements.add(const SizedBox(width: 8));
    });
    elements.removeLast();

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: elements,
      ),
    );
  }
}

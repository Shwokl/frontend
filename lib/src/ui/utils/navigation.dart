import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void navigateToLogin(BuildContext context, {Object args = const {}}) {
  Navigator.pushNamed(context, '/login', arguments: args);
}

void navigateToSignup(BuildContext context, {Object args = const {}}) {
  Navigator.pushNamed(context, '/signup', arguments: args);
}

void navigateToSettings(BuildContext context, {Object args = const {}}) {
  Navigator.pushNamed(context, '/settings', arguments: args);
}

void navigateToHome(BuildContext context, {Object args = const {}}) {
  Navigator.pushNamed(context, '/home', arguments: args);
}

void resetToHome(BuildContext context, {Object args = const {}}) {
  Navigator.pushReplacementNamed(context, '/home');
}

Future<void> navigateToURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

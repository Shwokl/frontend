import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

///
/// [showSnackbar] is self explanatory. It will display the given [content]
/// in a custom snackbar
///
void showSnackbar(
  BuildContext context, {
  @required String title,
  @required String message,
  @required Icon icon,
}) {
  Flushbar(
    titleText: Text(
      title,
      style: TextStyle(
        color: Theme.of(context).textTheme.headline1.color,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    messageText: Text(
      message,
      style: TextStyle(
        color: Theme.of(context).textTheme.headline1.color,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ),
    icon: icon,
    backgroundColor: Theme.of(context).primaryColor,
    padding: const EdgeInsets.all(32.0),
    maxWidth: 750,
    borderRadius: 8.0,
    margin: const EdgeInsets.all(64.0),
    duration: const Duration(seconds: 10),
  ).show(context);
}

void showErrorSnackbar(
  BuildContext context, {
  @required String title,
  @required String message,
}) {
  const Icon errorIcon = Icon(
    Icons.error_outline,
    color: Colors.red,
    size: 32.0,
  );
  showSnackbar(context, title: title, message: message, icon: errorIcon);
}

void showSuccessSnackbar(
  BuildContext context, {
  @required String title,
  @required String message,
}) {
  const Icon successIcon = Icon(
    Icons.check,
    color: Colors.green,
    size: 48.0,
  );
  showSnackbar(context, title: title, message: message, icon: successIcon);
}

void showWarningSnackbar(
  BuildContext context, {
  @required String title,
  @required String message,
}) {
  const Icon successIcon = Icon(
    Icons.warning_amber_outlined,
    color: Colors.orange,
    size: 48.0,
  );
  showSnackbar(context, title: title, message: message, icon: successIcon);
}

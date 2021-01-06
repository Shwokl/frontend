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
    title: title,
    message: message,
    icon: icon,
    boxShadows: const [BoxShadow(blurRadius: 16.0)],
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
    color: Colors.redAccent,
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
    color: Colors.greenAccent,
    size: 32.0,
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
    color: Colors.yellowAccent,
    size: 32.0,
  );
  showSnackbar(context, title: title, message: message, icon: successIcon);
}

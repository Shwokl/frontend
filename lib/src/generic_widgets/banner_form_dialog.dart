import 'package:flutter/material.dart';

class BannerFormDialog extends StatelessWidget {
  final Widget banner;
  final Widget form;

  const BannerFormDialog({
    @required this.banner,
    @required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      elevation: 8.0,
      color: Theme.of(context).primaryColorLight,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        constraints: const BoxConstraints(
          maxWidth: 1200,
          maxHeight: 650,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            banner,
            form,
          ],
        ),
      ),
    );
  }
}

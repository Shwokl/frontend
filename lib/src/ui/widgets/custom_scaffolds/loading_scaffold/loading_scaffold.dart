import 'package:flutter/material.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/background_scaffold/background_scaffold.dart';
import 'package:frontend/src/ui/widgets/custom_scaffolds/loading_scaffold/loading_indicator.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold();

  @override
  Widget build(BuildContext context) {
    return const BackgroundScaffold(body: LoadingIndicator());
  }
}

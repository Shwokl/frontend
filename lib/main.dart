import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('lib/src/assets/fonts/Poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['Poppins'], license);
  });

  runApp(const ShwoklApp());
}

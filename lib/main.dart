import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/bootstrap/app/app.dart';
import 'package:tsirbunenpottery/theme/app_status_bar_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  setAppStatusBarColor();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Note: We use the getIt service locator to help us manage our dependencies and
  // to make bloc-to-bloc communication easier.
  prepareBlocs();

  runApp(const App());
}

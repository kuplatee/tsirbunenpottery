import 'package:flutter/services.dart';
import 'package:madmudmobile/theme/colors.dart';

void setAppStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle().copyWith(
      statusBarColor: pale,
      systemNavigationBarColor: pale,
    ),
  );
}

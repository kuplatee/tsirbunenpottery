import 'package:flutter/services.dart';
import 'package:tsirbunenpottery/theme/colors.dart';

void setAppStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle().copyWith(
      statusBarColor: pale,
      systemNavigationBarColor: pale,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/widgets/horizontal_navigation/horizontal_navigation.dart';

const testDevices = <String, Size>{
  'MOBILE': Size(375, 600),
  // NOTE: Test font metrics (TextPainter) return wider characters than production
  // fonts, so canFit in HorizontalNavigation needs extra room. 900 accommodates
  // all 6 current routes. Revisit if routes are added or the estimate logic changes.
  'DESKTOP': Size(minWidthForShowNavBarRoutes + 900, 1200),
};

import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/horizontal_navigation/horizontal_navigation.dart';

const testDevices = <String, Size>{
  'MOBILE': Size(375, 600),
  // FIXME: There is something wrong here. The extra 300 should not be needed.
  'DESKTOP': Size(minWidthForShowNavBarRoutes + 300, 1200),
};

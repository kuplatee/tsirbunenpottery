import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String currentPageNameFromSettings(BuildContext context) {
  final routeSettings = ModalRoute.of(context)?.settings;
  String pageName = '';
  if (routeSettings is NoTransitionPage) {
    pageName = routeSettings.name ?? '';
  }

  return pageName;
}

import 'package:flutter/material.dart';
import 'package:madmudmobile/bootstrap/router/route_enum.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

extension DrawerRouteExtension on RouteEnum {
  IconData get iconData => switch (this) {
        RouteEnum.home => Symbols.home,
        RouteEnum.pieces => Symbols.local_cafe_rounded,
        RouteEnum.categories => Symbols.category_rounded,
        RouteEnum.collections => Symbols.hub_rounded,
        RouteEnum.contact => Symbols.contact_page_rounded,
      };
}

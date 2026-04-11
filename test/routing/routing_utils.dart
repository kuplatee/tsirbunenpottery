import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_item.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:madmudmobile/localization/en.dart';
import 'package:madmudmobile/features/home/presentation/pages/home_page.dart';
import 'package:madmudmobile/features/pieces/presentation/pages/pieces_page.dart';
import 'package:madmudmobile/features/designs/presentation/pages/designs_page.dart';
import 'package:madmudmobile/features/categories/presentation/pages/categories_page.dart';
import 'package:madmudmobile/features/collections/presentation/pages/collections_page.dart';
import 'package:madmudmobile/features/contact/presentation/pages/contact_page.dart';
import 'package:madmudmobile/widgets/horizontal_navigation/horizontal_navigation.dart';

final english = En();

List<String> routeNames = [
  english.translate(Translation.home),
  english.translate(Translation.pieces),
  english.translate(Translation.designs),
  english.translate(Translation.categories),
  english.translate(Translation.collections),
  english.translate(Translation.contact),
];

final routeToPage = {
  'Home': HomePage,
  'Pieces': PiecesPage,
  'Designs': DesignsPage,
  'Categories': CategoriesPage,
  'Collections': CollectionsPage,
  'Contact': ContactPage,
};

// Note: This results in extra transitions between the pages but it does not matter
// because the tests are so fast anyway.
final routeOrder = () {
  final Set<String> fromToPairs = {};
  for (var fromRoute in routeNames) {
    for (var toRoute in routeNames) {
      if (fromRoute != toRoute) fromToPairs.add('$fromRoute-$toRoute');
    }
  }

  final List<String> routeOrder = [];
  for (var pair in fromToPairs) {
    routeOrder.addAll(pair.split('-'));
  }

  return routeOrder;
}();

Future<void> openDrawer(WidgetTester tester) async {
  final openDrawerButtonFinder = find.byIcon(Symbols.menu);
  await tester.tap(openDrawerButtonFinder);
  await tester.pumpAndSettle();
}

Future<void> clickDrawerRoute(WidgetTester tester, String route) async {
  final routeFinders = find.text(route);
  // Note: routeFinders contain both the drawer items and the horizontal navBar items
  // so when testing the drawer we need to ignore the horizontal navBar items
  final targetFinder = find.descendant(
    of: find.byType(DrawerRouteItem),
    matching: routeFinders,
  );
  expect(targetFinder, findsOneWidget);
  await tester.tap(targetFinder);
  await tester.pumpAndSettle();
}

Future<void> clickNavBarRoute(WidgetTester tester, String route) async {
  // Note: Both the nav bar and the footer render route names, so scope to
  // HorizontalNavigation to avoid ambiguity.
  final targetFinder = find.descendant(
    of: find.byType(HorizontalNavigation),
    matching: find.text(route),
  );

  expect(targetFinder, findsOneWidget);
  await tester.tap(targetFinder);
  await tester.pumpAndSettle();
}

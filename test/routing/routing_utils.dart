import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/drawer/drawer_route_item.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:madmudmobile/localization/en.dart';
// import 'package:madmudmobile/features/story/presentation/story_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/collections_page.dart';
import 'package:madmudmobile/features/contact/presentation/contact_page.dart';
import 'package:madmudmobile/features/home/presentation/home_page.dart';
import 'package:madmudmobile/features/products/presentation/pages/categories_page.dart';

final english = En();

List<String> routeNames = [
  english.translate(Translation.home),
  english.translate(Translation.categories),
  english.translate(Translation.collections),
  english.translate(Translation.contact),
  english.translate(Translation.story),
];

final routeToPage = {
  'Home': HomePage,
  'Categories': CategoriesPage,
  'Collections': CollectionsPage,
  'Contact': ContactPage,
  // 'Story': StoryPage,
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

openDrawer(WidgetTester tester) async {
  final openDrawerButtonFinder = find.byIcon(Symbols.menu);
  await tester.tap(openDrawerButtonFinder);
  await tester.pumpAndSettle();
}

clickDrawerRoute(WidgetTester tester, String route) async {
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

clickNavBarRoute(WidgetTester tester, String route) async {
  // Note: When the drawer is not open, only the horizontal navBar items are available
  final routeFinders = find.text(route);

  expect(routeFinders, findsOneWidget);
  await tester.tap(routeFinders);
  await tester.pumpAndSettle();
}

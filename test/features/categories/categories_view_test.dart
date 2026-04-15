import 'package:flutter_test/flutter_test.dart';

import '../../routing/routing_utils.dart';
import '../../utils/barrel.dart';

void main() {
  group('Feature Categories >', () {
    group('CategoriesView -', () {
      setUpAndTearDownAllBlocsAndPreventNetworkImages();

      testWidgets(
          'shows names for all categories that have at least one piece',
          (tester) async {
        // Use desktop width so HorizontalNavigation is visible for tapping.
        setViewSizeAndAddTeardown(tester, testDevices['DESKTOP']!);
        await pumpApp(tester);

        // Navigate to Categories. pumpAndSettle() inside clickNavBarRoute
        // also flushes the bloc's async fetch, so state is ok by the time
        // we assert.
        await clickNavBarRoute(tester, 'Categories');

        expect(find.text('Mugs and Cups'), findsOneWidget);
        expect(find.text('Plates and Bowls'), findsOneWidget);
        expect(find.text('Kitchen Accessories'), findsOneWidget);
      });

      testWidgets(
          'does not show a category that has no pieces',
          (tester) async {
        setViewSizeAndAddTeardown(tester, testDevices['DESKTOP']!);
        await pumpApp(tester);
        await clickNavBarRoute(tester, 'Categories');

        expect(find.text('Empty Category'), findsNothing);
      });
    });
  });
}

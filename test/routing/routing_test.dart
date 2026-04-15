import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/widgets/horizontal_navigation/horizontal_navigation.dart';
import '../utils/barrel.dart';
import 'routing_utils.dart';

void main() {
  group('Routing >', () {
    setUpAndTearDownAllBlocsAndPreventNetworkImages();
    group('Drawer -', () {
      testDevices.forEach((String description, Size size) {
        testWidgets('drawer can be opened in $description',
            (WidgetTester tester) async {
          setViewSizeAndAddTeardown(tester, size);
          await pumpApp(tester);

          expect(find.byType(Drawer), findsNothing);
          await openDrawer(tester);
          expect(find.byType(Drawer), findsOneWidget);
        });

        testWidgets('routes can be navigated to and from in $description',
            (WidgetTester tester) async {
          setViewSizeAndAddTeardown(tester, size);
          await pumpApp(tester);

          for (int i = 0; i < routeOrder.length - 1; i++) {
            final routeTo = routeOrder[i + 1];
            final page = routeToPage[routeTo]!;
            await openDrawer(tester);
            await clickDrawerRoute(tester, routeTo);
            expect(find.byType(page), findsOneWidget);
          }
        });
      });
    });

    group('Nav Bar -', () {
      testDevices.forEach((String description, Size size) {
        testWidgets(
            'horizontal navigation is${description == 'DESKTOP' ? "" : " not"} visible in $description',
            (WidgetTester tester) async {
          setViewSizeAndAddTeardown(tester, size);
          await pumpApp(tester);

          if (description == 'DESKTOP') {
            expect(find.byType(HorizontalNavigation), findsOneWidget);
          } else {
            expect(find.byType(TextButton), findsNothing);
          }
        });
      });

      testWidgets('routes can be navigated to and from in DESKTOP',
          (WidgetTester tester) async {
        setViewSizeAndAddTeardown(tester, testDevices['DESKTOP']!);
        await pumpApp(tester);

        for (int i = 0; i < routeOrder.length - 1; i++) {
          final routeTo = routeOrder[i + 1];
          final page = routeToPage[routeTo]!;
          await clickNavBarRoute(tester, routeTo);
          expect(find.byType(page), findsOneWidget);
        }
      });
    });
  });
}

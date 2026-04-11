import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/bootstrap/app/app.dart';

Future<void> pumpMadMudApp(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  await tester.pumpAndSettle();
}

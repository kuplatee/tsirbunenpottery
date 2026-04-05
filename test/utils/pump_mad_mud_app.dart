import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/bootstrap/tsirbunen_pottery_app/tsirbunen_pottery_app.dart';

pumpMadMudApp(WidgetTester tester) async {
  await tester.pumpWidget(const TsirbunenPotteryApp());
  await tester.pumpAndSettle();
}

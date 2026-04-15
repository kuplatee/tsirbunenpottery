import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/bootstrap/app/app.dart';

Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  await tester.pumpAndSettle();
}

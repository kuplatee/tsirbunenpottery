import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/app/tsirbunen_pottery_app/tsirbunen_pottery_app.dart';
import '../utils/prepare_blocs_for_tests.dart';

void main() {
  group('TSIRBUNEN POTTERY APP >', () {
    group('APP -', () {
      setUpAndTearDownAllBlocsAndPreventNetworkImages();
      testWidgets('app launches successfully', (WidgetTester tester) async {
        await tester.pumpWidget(const TsirbunenPotteryApp());

        expect(find.byType(TsirbunenPotteryApp), findsOneWidget);
      });
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/bootstrap/app/app.dart';
import '../utils/prepare_blocs_for_tests.dart';

void main() {
  group('Tsirbunen Pottery App > ', () {

      setUpAndTearDownAllBlocsAndPreventNetworkImages();
      testWidgets('app launches successfully', (WidgetTester tester) async {
        await tester.pumpWidget(const App());

        expect(find.byType(App), findsOneWidget);
      });
    });
  
}

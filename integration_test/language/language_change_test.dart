import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tsirbunenpottery/bootstrap/app/app.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import '../utils/integration_test_utils.dart';
import 'language_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('LANGUAGE -', () {
    setUpAll(() {
      prepareBlocsForIntegrationTests();
    });

    tearDownAll(() {
      getIt.reset();
    });

    testWidgets('can be changed', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await changeLanguage(tester);
      final bloc = getIt<LanguageBloc>();
      expect(bloc.state.language, Language.fi);
      verifyVisibleAppLanguage(tester, Language.fi);

      await changeLanguage(tester);
      expect(bloc.state.language, Language.en);
      verifyVisibleAppLanguage(tester, Language.en);
    });
  });
}

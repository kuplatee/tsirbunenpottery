import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/tsirbunen_pottery_app/tsirbunen_pottery_app.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'language_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  prepareBlocs();

  group('LANGUAGE -', () {
    testWidgets('can be changed', (
      tester,
    ) async {
      await tester.pumpWidget(const TsirbunenPotteryApp());
      await tester.pumpAndSettle();

      await changeLanguage(tester);
      final bloc = getIt<GeneralStateBloc>();
      expect(bloc.state.language, Language.fi);
      verifyVisibleAppLanguage(tester, Language.fi);

      await changeLanguage(tester);
      expect(bloc.state.language, Language.en);
      verifyVisibleAppLanguage(tester, Language.en);
    });
  });
}

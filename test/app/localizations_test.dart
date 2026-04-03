import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/localization/en.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/localization/translations.dart';
import 'package:madmudmobile/localization/validate_translations.dart';
import '../utils/prepare_blocs_for_tests.dart';

class MockTranslations implements Translations {
  final Map<String, String> _all;
  MockTranslations(this._all);

  @override
  String get language => 'Mock';

  @override
  String translate(Translation key) => _all[key.name] ?? '';

  @override
  Map<String, String> get all => _all;
}

void main() {
  group('LOCALIZATIONS >', () {
    setUpAndTearDownAllBlocsAndPreventNetworkImages();
    test('does not throw when all keys match', () {
      final en = En();
      expect(() => validateTranslations(en), returnsNormally);
    });

    test('throws when keys are missing', () {
      final en = En();
      final modifiedTranslations = {
        ...en.all,
      }..remove('tradeName');

      final mockTranslations = MockTranslations(modifiedTranslations);

      expect(
        () => validateTranslations(mockTranslations),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString().contains('is missing the following keys:'))),
      );
    });

    test('throws when extra keys are present', () {
      final en = En();
      final modifiedTranslations = {
        ...en.all,
        'extraKey': 'Extra Value',
      };

      final mockTranslations = MockTranslations(modifiedTranslations);

      expect(
        () => validateTranslations(mockTranslations),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString().contains('has extra keys that are not in the enum:'))),
      );
    });

    test('all app language translations are valid', () {
      final appLanguages = [
        En(),
      ];

      for (final language in appLanguages) {
        expect(
          () => validateTranslations(language),
          returnsNormally,
          reason: 'Language ${language.language} has missing or extra keys',
        );
      }
    });
  });
}

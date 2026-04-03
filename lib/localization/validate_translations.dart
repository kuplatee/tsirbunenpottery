import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/localization/translations.dart';

// FIXME: Find a better way to check the translations, for example move on to some code generation
void validateTranslations(Translations translations) {
  final keysInEnum = Translation.values.map((e) => e.name).toSet();
  final keysInMap = translations.all.keys.toSet();

  final missing = keysInEnum.difference(keysInMap);
  final extra = keysInMap.difference(keysInEnum);

  if (missing.isNotEmpty) {
    throw Exception(
        'Language ${translations.language} is missing the following keys:\n${missing.toList().join('\n')}');
  }
  if (extra.isNotEmpty) {
    throw Exception(
        'Language ${translations.language} has extra keys that are not in the enum:\n${extra.toList().join('\n')}');
  }
}

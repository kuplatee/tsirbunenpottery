import 'package:madmudmobile/localization/languages.dart';

class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final Language language;

  ChangeLanguage(this.language);
}

import 'package:madmudmobile/localization/languages.dart';

class GeneralStateEvent {}

class ChangeLanguage extends GeneralStateEvent {
  final Language language;

  ChangeLanguage(this.language);
}

class FetchHomePageImageFileName extends GeneralStateEvent {
  FetchHomePageImageFileName();
}

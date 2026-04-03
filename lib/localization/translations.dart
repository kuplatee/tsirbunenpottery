import 'package:madmudmobile/localization/translation.dart';

abstract class Translations {
  String get language;
  Map<String, String> get all;

  String translate(Translation key);
}

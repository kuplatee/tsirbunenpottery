import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:madmudmobile/localization/fi.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/localization/translations.dart';
import 'en.dart';

class AppLocale {
  final Locale locale;
  late Translations translations;

  AppLocale(this.locale) {
    if (locale.languageCode == 'fi') {
      translations = Fi();
    } else {
      translations = En();
    }
  }

  static AppLocale of(final BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale)!;
  }

  static const LocalizationsDelegate<AppLocale> delegate =
      CustomLocalizationsDelegate();

  String translate(final Translation key) {
    return translations.translate(key);
  }

  static Iterable<Locale> get supportedLocales => [
        const Locale('en'),
        const Locale('fi'),
      ];
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<AppLocale> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(final Locale locale) {
    return AppLocale.supportedLocales.contains(locale);
  }

  @override
  Future<AppLocale> load(Locale locale) {
    return SynchronousFuture<AppLocale>(AppLocale(locale));
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) {
    return true;
  }
}

// Note: This is to enable the use of translation with a very short syntax,
// for example context.local('tradeName'), instead the the general
// Local.of(context).translate('tradeName')
extension LocalizedTranslationBuildContext on BuildContext {
  String local(final Translation key) => AppLocale.of(this).translate(key);
}

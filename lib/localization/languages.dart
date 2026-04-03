import 'package:flutter/material.dart';

enum Language {
  en,
  fi,
}

extension LanguageToLocale on Language {
  Locale toLocale() {
    switch (this) {
      case Language.en:
        return const Locale('en', 'US');
      case Language.fi:
        return const Locale('fi', 'FI');
    }
  }
}

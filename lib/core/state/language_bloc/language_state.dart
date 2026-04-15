import 'package:equatable/equatable.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

class LanguageState extends Equatable {
  final Language language;

  const LanguageState({this.language = Language.fi});

  LanguageState copyWith({Language? newLanguage}) {
    return LanguageState(language: newLanguage ?? language);
  }

  @override
  List<Object> get props => [language];
}

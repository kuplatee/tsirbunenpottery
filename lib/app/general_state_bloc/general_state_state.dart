import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/localization/languages.dart';

class GeneralState extends Equatable {
  final BlocStatus blocStatus;
  final Language language;
  final String? homePageImageFileName;

  const GeneralState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.language = Language.fi,
    this.homePageImageFileName,
  });

  GeneralState copyWith({
    BlocStatus? newStatus,
    Language? newLanguage,
    String? newHomePageImageFileName,
  }) {
    return GeneralState(
      blocStatus: newStatus ?? blocStatus,
      language: newLanguage ?? language,
      homePageImageFileName: newHomePageImageFileName ?? homePageImageFileName,
    );
  }

  @override
  List<Object?> get props => [
        blocStatus,
        language,
        homePageImageFileName,
      ];
}

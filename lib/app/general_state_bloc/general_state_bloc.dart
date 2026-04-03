import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_event.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/app/general_state_bloc/utils.dart';
import 'package:madmudmobile/common_cloud_service/common_cloud_service.dart';
import 'package:madmudmobile/utils/constants.dart';

class GeneralStateBloc extends Bloc<GeneralStateEvent, GeneralState> {
  final CommonCloudService _commonCloudService;

  GeneralStateBloc(this._commonCloudService) : super(const GeneralState()) {
    on<GeneralStateEvent>(_onEvent);
  }

  Future<void> _onEvent(
    GeneralStateEvent event,
    Emitter<GeneralState> emit,
  ) async {
    return switch (event) {
      final ChangeLanguage e => _onChangeLanguage(e, emit),
      final FetchHomePageImageFileName e =>
        _onFetchHomePageImageFileName(e, emit),
      final GeneralStateEvent _ => emit(state),
    };
  }

  Future<void> _onChangeLanguage(
      ChangeLanguage event, Emitter<GeneralState> emit) async {
    emit(state.copyWith(newLanguage: event.language));
  }

  Future<void> _onFetchHomePageImageFileName(
      FetchHomePageImageFileName event, Emitter<GeneralState> emit) async {
    try {
      final homePageFileName = await _commonCloudService.fetchOneFromCloud(
          collectionName: 'miscellaneous',
          fromDocument: toHomePageFileName,
          documentId: homePageImageDocId);

      if (homePageFileName != null) {
        emit(state.copyWith(newHomePageImageFileName: homePageFileName));
      } else {
        emit(state);
      }
    } catch (e) {
      emit(state);
    }
  }
}

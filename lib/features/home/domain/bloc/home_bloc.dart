import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/home/domain/bloc/home_event.dart';
import 'package:madmudmobile/features/home/domain/bloc/home_state.dart';
import 'package:madmudmobile/features/home/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeState()) {
    on<FetchHomePageImageFileName>(_onFetchHomePageImageFileName);
  }

  Future<void> _onFetchHomePageImageFileName(
    FetchHomePageImageFileName event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final fileName = await _repository.fetchHomePageImageFileName();
      if (fileName != null) {
        emit(state.copyWith(newHomePageImageFileName: fileName));
      }
    } catch (e) {
      emit(state.copyWith(
        newStatus: BlocStatus(Status.error, message: e.toString()),
      ));
    }
  }
}

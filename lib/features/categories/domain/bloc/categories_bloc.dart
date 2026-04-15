import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_event.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_state.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _repository;

  CategoriesBloc(this._repository) : super(const CategoriesState()) {
    on<CategoriesEvent>(_onEvent);
  }

  Future<void> _onEvent(
      CategoriesEvent event, Emitter<CategoriesState> emit) async {
    return switch (event) {
      final BlocStatusChanged e => emit(state.copyWithStatus(e.status)),
      final FetchCategories _ => _onFetch(emit),
      final CategoriesEvent _ => emit(state),
    };
  }

  Future<void> _onFetch(Emitter<CategoriesState> emit) async {
    emit(state.copyWithStatus(const BlocStatus(Status.loading)));
    try {
      final data = await _repository.getData();
      emit(CategoriesState(
        categories: data.categories,
        designsById: data.designsById,
        piecesById: data.piecesById,
        categoryDesigns: data.categoryDesigns,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e) {
      emit(state.copyWithStatus(BlocStatus(Status.error, message: e.toString())));
    }
  }
}

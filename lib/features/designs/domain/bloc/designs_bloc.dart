import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/core/types/bloc_status/bloc_status.dart';
import 'package:madmudmobile/features/designs/domain/bloc/designs_event.dart';
import 'package:madmudmobile/features/designs/domain/bloc/designs_state.dart';
import 'package:madmudmobile/features/designs/repository/designs_repository.dart';

class DesignsBloc extends Bloc<DesignsEvent, DesignsState> {
  final DesignsRepository _repository;

  DesignsBloc(this._repository) : super(const DesignsState()) {
    on<DesignsEvent>(_onEvent);
  }

  Future<void> _onEvent(DesignsEvent event, Emitter<DesignsState> emit) async {
    return switch (event) {
      final BlocStatusChanged e => emit(state.copyWithStatus(e.status)),
      final FetchDesigns _ => _onFetch(emit),
      final DesignsEvent _ => emit(state),
    };
  }

  Future<void> _onFetch(Emitter<DesignsState> emit) async {
    emit(state.copyWithStatus(const BlocStatus(Status.loading)));
    try {
      final data = await _repository.getData();
      emit(DesignsState(
        designsById: data.designsById,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        piecesByDesignId: data.piecesByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e) {
      emit(state.copyWithStatus(BlocStatus(Status.error, message: e.toString())));
    }
  }
}

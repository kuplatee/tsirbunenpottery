import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/core/types/bloc_status/bloc_status.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_event.dart';
import 'package:madmudmobile/features/pieces/domain/bloc/pieces_state.dart';
import 'package:madmudmobile/features/pieces/repository/pieces_repository.dart';

class PiecesBloc extends Bloc<PiecesEvent, PiecesState> {
  final PiecesRepository _repository;

  PiecesBloc(this._repository) : super(const PiecesState()) {
    on<PiecesEvent>(_onEvent);
  }

  Future<void> _onEvent(PiecesEvent event, Emitter<PiecesState> emit) async {
    return switch (event) {
      final BlocStatusChanged e => emit(state.copyWithStatus(e.status)),
      final FetchPieces _ => _onFetch(emit),
      final PiecesEvent _ => emit(state),
    };
  }

  Future<void> _onFetch(Emitter<PiecesState> emit) async {
    emit(state.copyWithStatus(const BlocStatus(Status.loading)));
    try {
      final data = await _repository.getData();
      emit(PiecesState(
        piecesById: data.piecesById,
        designsById: data.designsById,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        pieceIdsByDesignId: data.pieceIdsByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e) {
      emit(state.copyWithStatus(BlocStatus(Status.error, message: e.toString())));
    }
  }
}

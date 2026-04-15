import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_event.dart';
import 'package:tsirbunenpottery/features/collections/domain/bloc/collections_state.dart';
import 'package:tsirbunenpottery/features/collections/repository/collections_repository.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final CollectionsRepository _repository;

  CollectionsBloc(this._repository) : super(const CollectionsState()) {
    on<CollectionsEvent>(_onEvent);
  }

  Future<void> _onEvent(
      CollectionsEvent event, Emitter<CollectionsState> emit) async {
    return switch (event) {
      final BlocStatusChanged e => emit(state.copyWithStatus(e.status)),
      final FetchCollections _ => _onFetch(emit),
      final CollectionsEvent _ => emit(state),
    };
  }

  Future<void> _onFetch(Emitter<CollectionsState> emit) async {
    emit(state.copyWithStatus(const BlocStatus(Status.loading)));
    try {
      final data = await _repository.getData();
      emit(CollectionsState(
        collections: data.collections,
        designsById: data.designsById,
        piecesById: data.piecesById,
        collectionDesigns: data.collectionDesigns,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e) {
      emit(state.copyWithStatus(BlocStatus(Status.error, message: e.toString())));
    }
  }
}

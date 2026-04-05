import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/collections/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/features/pieces/domain/models/piece/piece.dart';

class CollectionsState extends Equatable {
  final BlocStatus blocStatus;
  final List<Collection> collections;
  final Map<String, Design> designsById;
  final Map<String, Piece> piecesById;

  // collectionId → designId → list of piece IDs
  final Map<String, Map<String, List<String>>> collectionDesigns;

  // designId → list of image file names (across all pieces of that design)
  final Map<String, List<String>> imageFileNamesByDesignId;

  const CollectionsState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.collections = const [],
    this.designsById = const {},
    this.piecesById = const {},
    this.collectionDesigns = const {},
    this.imageFileNamesByDesignId = const {},
  });

  CollectionsState copyWithStatus(BlocStatus status) => CollectionsState(
        blocStatus: status,
        collections: collections,
        designsById: designsById,
        piecesById: piecesById,
        collectionDesigns: collectionDesigns,
        imageFileNamesByDesignId: imageFileNamesByDesignId,
      );

  @override
  List<Object?> get props => [blocStatus, collections];
}

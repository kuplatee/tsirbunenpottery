import 'package:equatable/equatable.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

class PiecesState extends Equatable {
  final BlocStatus blocStatus;
  final Map<String, Piece> piecesById;
  final Map<String, Design> designsById;

  // designId → list of image file names (across all pieces of that design)
  final Map<String, List<String>> imageFileNamesByDesignId;

  // designId → list of piece IDs (used to group pieces by design for display)
  final Map<String, List<String>> pieceIdsByDesignId;

  const PiecesState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.piecesById = const {},
    this.designsById = const {},
    this.imageFileNamesByDesignId = const {},
    this.pieceIdsByDesignId = const {},
  });

  PiecesState copyWithStatus(BlocStatus status) => PiecesState(
        blocStatus: status,
        piecesById: piecesById,
        designsById: designsById,
        imageFileNamesByDesignId: imageFileNamesByDesignId,
        pieceIdsByDesignId: pieceIdsByDesignId,
      );

  @override
  List<Object?> get props => [blocStatus, piecesById, designsById, imageFileNamesByDesignId, pieceIdsByDesignId];
}

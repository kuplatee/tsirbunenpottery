import 'package:equatable/equatable.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

class DesignsState extends Equatable {
  final BlocStatus blocStatus;
  final Map<String, Design> designsById;

  // designId → list of image file names (across all pieces of that design)
  final Map<String, List<String>> imageFileNamesByDesignId;
  final Map<String, List<Piece>> piecesByDesignId;

  const DesignsState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.designsById = const {},
    this.imageFileNamesByDesignId = const {},
    this.piecesByDesignId = const {},
  });

  DesignsState copyWithStatus(BlocStatus status) => DesignsState(
        blocStatus: status,
        designsById: designsById,
        imageFileNamesByDesignId: imageFileNamesByDesignId,
        piecesByDesignId: piecesByDesignId,
      );

  @override
  List<Object?> get props => [blocStatus, designsById, imageFileNamesByDesignId, piecesByDesignId];
}

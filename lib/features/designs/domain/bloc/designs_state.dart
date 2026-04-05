import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';

class DesignsState extends Equatable {
  final BlocStatus blocStatus;
  final Map<String, Design> designsById;

  // designId → list of image file names (across all pieces of that design)
  final Map<String, List<String>> imageFileNamesByDesignId;

  const DesignsState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.designsById = const {},
    this.imageFileNamesByDesignId = const {},
  });

  DesignsState copyWithStatus(BlocStatus status) => DesignsState(
        blocStatus: status,
        designsById: designsById,
        imageFileNamesByDesignId: imageFileNamesByDesignId,
      );

  @override
  List<Object?> get props => [blocStatus, designsById];
}

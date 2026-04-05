import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/categories/domain/models/category/category.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/features/pieces/domain/models/piece/piece.dart';

class CategoriesState extends Equatable {
  final BlocStatus blocStatus;
  final List<Category> categories;
  final Map<String, Design> designsById;
  final Map<String, Piece> piecesById;

  // categoryId → designId → list of piece IDs
  final Map<String, Map<String, List<String>>> categoryDesigns;

  // designId → list of image file names (across all pieces of that design)
  final Map<String, List<String>> imageFileNamesByDesignId;

  const CategoriesState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.categories = const [],
    this.designsById = const {},
    this.piecesById = const {},
    this.categoryDesigns = const {},
    this.imageFileNamesByDesignId = const {},
  });

  CategoriesState copyWithStatus(BlocStatus status) => CategoriesState(
        blocStatus: status,
        categories: categories,
        designsById: designsById,
        piecesById: piecesById,
        categoryDesigns: categoryDesigns,
        imageFileNamesByDesignId: imageFileNamesByDesignId,
      );

  @override
  List<Object?> get props => [blocStatus, categories];
}

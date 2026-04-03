import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/features/products/domain/models/category/category.dart';
import 'package:madmudmobile/features/products/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';

class ProductsState extends Equatable {
  final BlocStatus blocStatus;
  final List<Collection> collections;
  final List<Category> categories;
  final Map<String, Piece> piecesById;
  final Map<String, Design> designsById;
  final Map<String, Map<String, List<String>>> collectionDesigns;
  final Map<String, Map<String, List<String>>> categoryDesigns;
  final Map<String, List<String>> imageFileNamesByDesignId;
  final Map<String, Map<String, List<String>>> allDesigns;

  const ProductsState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.piecesById = const {},
    this.designsById = const {},
    this.collections = const [],
    this.categories = const [],
    this.collectionDesigns = const {},
    this.categoryDesigns = const {},
    this.allDesigns = const {},
    this.imageFileNamesByDesignId = const {},
  });

  ProductsState copyWithStateChange({BlocStatus? newStatus}) {
    return ProductsState(
      blocStatus: newStatus ?? blocStatus,
      piecesById: piecesById,
      designsById: designsById,
      collections: collections,
      categories: categories,
      collectionDesigns: collectionDesigns,
      categoryDesigns: categoryDesigns,
      allDesigns: allDesigns,
      imageFileNamesByDesignId: imageFileNamesByDesignId,
    );
  }

  @override
  List<Object?> get props => [
        blocStatus,
        // Note: The products data is not expected to change while user is using the app.
        // We probably need to check only the piecesById, for if there is any change
        // to the products data, that is reflected in the piecesById.
        piecesById,
      ];

  List<Piece> piecesByDesignId(String designId) {
    return piecesById.values
        .where((piece) => piece.designId == designId)
        .toList();
  }
}

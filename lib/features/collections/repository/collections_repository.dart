import 'package:madmudmobile/common_data/products_repository.dart';
import 'package:madmudmobile/features/collections/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/features/pieces/domain/models/piece/piece.dart';

typedef CollectionsData = ({
  List<Collection> collections,
  Map<String, Design> designsById,
  Map<String, Piece> piecesById,
  Map<String, Map<String, List<String>>> collectionDesigns,
  Map<String, List<String>> imageFileNamesByDesignId,
});

class CollectionsRepository {
  final ProductsRepository _productsRepository;

  CollectionsRepository(this._productsRepository);

  Future<CollectionsData> getData() async {
    final products = await _productsRepository.getProducts();

    final designsById = {for (final d in products.designs) d.id: d};
    final piecesById = {for (final p in products.pieces) p.id: p};
    final Map<String, Map<String, List<String>>> collectionDesigns = {};
    final Map<String, List<String>> imageFileNamesByDesignId = {};

    for (final piece in products.pieces) {
      final collectionId = piece.collectionId;
      if (collectionId == null) continue;
      if (!designsById.containsKey(piece.designId)) continue;
      imageFileNamesByDesignId
          .putIfAbsent(piece.designId, () => [])
          .addAll(piece.imageFileNames);
      collectionDesigns
          .putIfAbsent(collectionId, () => {})[piece.designId] ??= [];
      if (!collectionDesigns[collectionId]![piece.designId]!.contains(piece.id)) {
        collectionDesigns[collectionId]![piece.designId]!.add(piece.id);
      }
    }

    return (
      collections: products.collections,
      designsById: designsById,
      piecesById: piecesById,
      collectionDesigns: collectionDesigns,
      imageFileNamesByDesignId: imageFileNamesByDesignId,
    );
  }
}

import 'package:madmudmobile/data/products_repository.dart';
import 'package:madmudmobile/features/categories/domain/models/category/category.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/features/pieces/domain/models/piece/piece.dart';

typedef CategoriesData = ({
  List<Category> categories,
  Map<String, Design> designsById,
  Map<String, Piece> piecesById,
  Map<String, Map<String, List<String>>> categoryDesigns,
  Map<String, List<String>> imageFileNamesByDesignId,
});

class CategoriesRepository {
  final ProductsRepository _productsRepository;

  CategoriesRepository(this._productsRepository);

  Future<CategoriesData> getData() async {
    final products = await _productsRepository.getProducts();

    final designsById = {for (final d in products.designs) d.id: d};
    final piecesById = {for (final p in products.pieces) p.id: p};
    final Map<String, Map<String, List<String>>> categoryDesigns = {};
    final Map<String, List<String>> imageFileNamesByDesignId = {};

    for (final piece in products.pieces) {
      final design = designsById[piece.designId];
      if (design == null) continue;
      imageFileNamesByDesignId
          .putIfAbsent(piece.designId, () => [])
          .addAll(piece.imageFileNames);
      for (final categoryId in design.categoryIds) {
        categoryDesigns.putIfAbsent(categoryId, () => {})[design.id] ??= [];
        categoryDesigns[categoryId]![design.id]!.add(piece.id);
      }
    }

    return (
      categories: products.categories,
      designsById: designsById,
      piecesById: piecesById,
      categoryDesigns: categoryDesigns,
      imageFileNamesByDesignId: imageFileNamesByDesignId,
    );
  }
}

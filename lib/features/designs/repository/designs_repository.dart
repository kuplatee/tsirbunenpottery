import 'package:madmudmobile/common_data/products_repository.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';

typedef DesignsData = ({
  Map<String, Design> designsById,
  Map<String, List<String>> imageFileNamesByDesignId,
});

class DesignsRepository {
  final ProductsRepository _productsRepository;

  DesignsRepository(this._productsRepository);

  Future<DesignsData> getData() async {
    final products = await _productsRepository.getProducts();

    final designsById = {for (final d in products.designs) d.id: d};
    final Map<String, List<String>> imageFileNamesByDesignId = {};

    for (final piece in products.pieces) {
      if (!designsById.containsKey(piece.designId)) continue;
      imageFileNamesByDesignId
          .putIfAbsent(piece.designId, () => [])
          .addAll(piece.imageFileNames);
    }

    return (
      designsById: designsById,
      imageFileNamesByDesignId: imageFileNamesByDesignId,
    );
  }
}

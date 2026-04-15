import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

typedef DesignsData = ({
  Map<String, Design> designsById,
  Map<String, List<String>> imageFileNamesByDesignId,
  Map<String, List<Piece>> piecesByDesignId,
});

class DesignsRepository {
  final ProductsRepository _productsRepository;

  DesignsRepository(this._productsRepository);

  Future<DesignsData> getData() async {
    final products = await _productsRepository.getProducts();

    final designsById = {for (final d in products.designs) d.id: d};
    final Map<String, List<String>> imageFileNamesByDesignId = {};
    final Map<String, List<Piece>> piecesByDesignId = {};

    for (final piece in products.pieces) {
      if (!designsById.containsKey(piece.designId)) continue;
      imageFileNamesByDesignId
          .putIfAbsent(piece.designId, () => [])
          .addAll(piece.imageFileNames);
      piecesByDesignId.putIfAbsent(piece.designId, () => []).add(piece);
    }

    return (
      designsById: designsById,
      imageFileNamesByDesignId: imageFileNamesByDesignId,
      piecesByDesignId: piecesByDesignId,
    );
  }
}

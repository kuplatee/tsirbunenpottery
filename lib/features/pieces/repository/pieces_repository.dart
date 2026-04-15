import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';

typedef PiecesData = ({
  Map<String, Piece> piecesById,
  Map<String, Design> designsById,
  Map<String, List<String>> imageFileNamesByDesignId,
  Map<String, List<String>> pieceIdsByDesignId,
});

class PiecesRepository {
  final ProductsRepository _productsRepository;

  PiecesRepository(this._productsRepository);

  Future<PiecesData> getData() async {
    final products = await _productsRepository.getProducts();

    final designsById = {for (final d in products.designs) d.id: d};
    final piecesById = {for (final p in products.pieces) p.id: p};
    final Map<String, List<String>> imageFileNamesByDesignId = {};
    final Map<String, List<String>> pieceIdsByDesignId = {};

    for (final piece in products.pieces) {
      final designId = piece.designId;
      if (!designsById.containsKey(designId)) continue;
      imageFileNamesByDesignId
          .putIfAbsent(designId, () => [])
          .addAll(piece.imageFileNames);
      pieceIdsByDesignId.putIfAbsent(designId, () => []).add(piece.id);
    }

    return (
      piecesById: piecesById,
      designsById: designsById,
      imageFileNamesByDesignId: imageFileNamesByDesignId,
      pieceIdsByDesignId: pieceIdsByDesignId,
    );
  }
}

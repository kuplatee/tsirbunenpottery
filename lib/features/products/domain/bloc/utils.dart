import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/products/domain/models/products/products.dart';

Map<String, dynamic> organizeProductsData(Products products) {
  final Map<String, Piece> piecesById = {};
  final Map<String, Design> designsById = {};
  final Map<String, Map<String, List<String>>> collectionDesigns = {};
  final Map<String, Map<String, List<String>>> categoryDesigns = {};
  final Map<String, Map<String, List<String>>> allDesigns = {'allDesigns': {}};
  final Map<String, List<String>> imageFileNamesByDesignId = {};

  for (var design in products.designs) {
    designsById[design.id] = design;
  }

  for (final piece in products.pieces) {
    piecesById[piece.id] = piece;
    final designId = piece.designId;
    final design = designsById[designId];
    if (design != null) {
      final categoryIds = design.categoryIds;
      for (var categoryId in categoryIds) {
        if (!categoryDesigns.containsKey(categoryId)) {
          categoryDesigns[categoryId] = {};
        }

        if (!categoryDesigns[categoryId]!.containsKey(design.id)) {
          categoryDesigns[categoryId]![design.id] = [];
        }

        categoryDesigns[categoryId]![design.id]!.add(piece.id);
      }

      if (!imageFileNamesByDesignId.containsKey(designId)) {
        imageFileNamesByDesignId[designId] = [];
      }
      imageFileNamesByDesignId[designId]!.addAll(piece.imageFileNames);
    }

    final collectionId = piece.collectionId;
    if (collectionId != null) {
      if (!collectionDesigns.containsKey(collectionId)) {
        collectionDesigns[collectionId] = {};
      }

      if (!collectionDesigns[collectionId]!.containsKey(designId)) {
        collectionDesigns[collectionId]![designId] = [];
      }

      if (!collectionDesigns[collectionId]![designId]!.contains(piece.id)) {
        collectionDesigns[collectionId]![designId]!.add(piece.id);
      }
    }

    if (!allDesigns['allDesigns']!.containsKey(designId)) {
      allDesigns['allDesigns']![designId] = [];
    }

    if (!allDesigns['allDesigns']![designId]!.contains(piece.id)) {
      allDesigns['allDesigns']![designId]!.add(piece.id);
    }
  }

  return {
    'piecesById': piecesById,
    'designsById': designsById,
    'collectionDesigns': collectionDesigns,
    'categoryDesigns': categoryDesigns,
    'allDesigns': allDesigns,
    'imageFileNamesByDesignId': imageFileNamesByDesignId,
    'collections': products.collections,
    'categories': products.categories,
  };
}

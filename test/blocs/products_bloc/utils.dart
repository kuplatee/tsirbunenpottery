import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/features/products/domain/models/category/category.dart';
import 'package:madmudmobile/features/products/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/products/domain/models/design/design.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
import 'test_products.dart';

verifyProductsDataIsSuperficiallyProperlyOrganized(
    Map<String, dynamic> organizedData) {
  expect(organizedData['piecesById'], isA<Map<String, Piece>>());
  expect(organizedData['designsById'], isA<Map<String, Design>>());
  expect(organizedData['collectionDesigns'],
      isA<Map<String, Map<String, List<String>>>>());
  expect(organizedData['categoryDesigns'],
      isA<Map<String, Map<String, List<String>>>>());
  expect(organizedData['allDesigns'],
      isA<Map<String, Map<String, List<String>>>>());
  expect(organizedData['collections'], isA<List<Collection>>());
  expect(organizedData['categories'], isA<List<Category>>());

  expect(organizedData['piecesById'].length, testProducts.pieces.length);
  expect(organizedData['designsById'].length, testProducts.designs.length);
  expect(organizedData['collections'].length, testProducts.collections.length);
  expect(organizedData['categories'].length, testProducts.categories.length);
  final collectionIds =
      organizedData['collections'].map((collection) => collection.id).toSet();
  expect(collectionIds.length, testProducts.collections.length);
  final categoryIds =
      organizedData['categories'].map((category) => category.id).toSet();
  expect(categoryIds.length, testProducts.categories.length);
}

verifyNoEmptyCollectionsOrCategoriesInMappings(
    Map<String, dynamic> organizedData) {
  expect(organizedData['collectionDesigns'].length,
      testProducts.collections.length - 1);
  expect(organizedData['categoryDesigns'].length,
      testProducts.categories.length - 1);
}

verifyTestDesigns(Map<String, dynamic> organizedData) {
  expect(organizedData['allDesigns']['allDesigns'].length,
      testProducts.designs.length);
}

verifyCollectionMappingDesignPiecesAreCorrect(
    Map<String, dynamic> organizedData) {
  const targetCollection = whiteOnWhite;
  final piecesByDesign =
      organizedData['collectionDesigns'][targetCollection.id];
  expect(piecesByDesign, isA<Map<String, List<String>>>());

  final targetPieces = testPieces
      .where((piece) => piece.collectionId == targetCollection.id)
      .toList();

  final expectedPiecesByDesign = {};
  for (var piece in targetPieces) {
    final designId = piece.designId;
    if (!expectedPiecesByDesign.containsKey(designId)) {
      expectedPiecesByDesign[designId] = [];
    }
    expectedPiecesByDesign[designId]!.add(piece.id);
  }

  expect(piecesByDesign.length, expectedPiecesByDesign.length);
  for (var designId in expectedPiecesByDesign.keys) {
    expect(piecesByDesign[designId], expectedPiecesByDesign[designId]);
  }
}

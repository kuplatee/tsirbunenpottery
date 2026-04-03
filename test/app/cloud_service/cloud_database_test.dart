import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/features/products/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/products/domain/models/products/products.dart';
import 'package:madmudmobile/features/products/repository/cloud_service.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:madmudmobile/features/products/domain/models/category/category.dart';
import 'cloud_service_mocks.mocks.dart';
import 'test_data.dart';
import 'utils.dart';

final collectionModels = collectionsToModels();
final categoryModels = categoriesToModels();
final designModels = designsToModels();

void main() {
  group('CloudService', () {
    late MockFirebaseFirestore mockFirestore;
    late MockCollectionReference mockCollectionReference;
    late MockQuerySnapshot mockQuerySnapshot;
    late CloudService cloudService;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      mockCollectionReference = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      cloudService = CloudService(firestore: mockFirestore);
    });

    test('fetchItemsFromCloud should fetch categories', () async {
      prepareMocks('categories', mockFirestore, mockCollectionReference,
          mockQuerySnapshot, createMockCategoryDocs);
      final categories = await cloudService.fetchItemsFromCloud<Category>(
        path: 'categories',
        fromDocument: cloudService.toCategory,
      );

      expect(categories.length, mockCategoryDocsData.length);

      for (int i = 0; i < categories.length; i++) {
        final expected = mockCategoryDocsData[i];
        final actual = categories[i];

        expect(actual.id, expected['id']);

        final expectedNames = expected['names'] as Map<String, dynamic>;
        for (final langEntry in expectedNames.entries) {
          expect(
            actual.names.entries.any((e) =>
                e.key.name == langEntry.key && e.value == langEntry.value),
            isTrue,
          );
        }
      }
    });

    test('fetchItemsFromCloud should fetch collections', () async {
      prepareMocks('collections', mockFirestore, mockCollectionReference,
          mockQuerySnapshot, createMockCollectionDocs);
      final collections = await cloudService.fetchItemsFromCloud<Collection>(
        path: 'collections',
        fromDocument: cloudService.toCollection,
      );

      expect(collections.length, mockCollectionDocsData.length);

      for (int i = 0; i < collections.length; i++) {
        final expected = mockCollectionDocsData[i];
        final actual = collections[i];

        expect(actual.id, expected['id']);

        final expectedNames = expected['names'] as Map<String, dynamic>;
        for (final langEntry in expectedNames.entries) {
          expect(
              actual.names.entries.any((e) =>
                  e.key.name == langEntry.key && e.value == langEntry.value),
              isTrue);
        }
      }
    });

    test('fetchItemsFromCloud should fetch designs', () async {
      prepareMocks('designs', mockFirestore, mockCollectionReference,
          mockQuerySnapshot, createMockDesignDocs);

      final designs = await cloudService.fetchItemsFromCloud(
        path: 'designs',
        fromDocument: (doc) => cloudService.toDesign(doc, categoryModels),
      );

      expect(designs.length, mockDesignDocsData.length);

      for (int i = 0; i < designs.length; i++) {
        final expected = mockDesignDocsData[i];
        final actual = designs[i];

        expect(actual.id, expected['id']);

        final expectedNames = expected['names'] as Map<String, dynamic>;
        for (final langEntry in expectedNames.entries) {
          expect(
            actual.names.entries.any((e) =>
                e.key.name == langEntry.key && e.value == langEntry.value),
            isTrue,
          );
        }

        final expectedDescriptions =
            expected['description'] as Map<String, dynamic>;
        for (final langEntry in expectedDescriptions.entries) {
          expect(
            actual.description.entries.any((e) =>
                e.key.name == langEntry.key && e.value == langEntry.value),
            isTrue,
          );
        }

        final expectedCategoryIds = expected['categoryIds'] as List<dynamic>;
        expect(actual.categoryIds, containsAll(expectedCategoryIds));

        final expectedDetailsRaw = expected['details'] as Map<String, dynamic>;
        for (final langEntry in expectedDetailsRaw.entries) {
          // Decode the JSON string into a Map
          final expectedDetailMap = Map<String, String>.from(
            jsonDecode(langEntry.value as String) as Map<String, dynamic>,
          );

          final actualDetails = actual.details[
              Language.values.firstWhere((e) => e.name == langEntry.key)];

          expect(
            actualDetails?.keys,
            containsAll(expectedDetailMap.keys),
          );
        }
      }
    });

    test('fetchItemsFromCloud should fetch pieces', () async {
      prepareMocks('pieces', mockFirestore, mockCollectionReference,
          mockQuerySnapshot, createMockPieceDocs);

      final pieces = await cloudService.fetchItemsFromCloud<Piece?>(
        path: 'pieces',
        fromDocument: (doc) => cloudService.toPiece(
          doc,
          designModels,
          collectionModels,
        ),
      );

      expect(pieces.length, mockPieceDocsData.length);

      for (int i = 0; i < pieces.length; i++) {
        final expected = mockPieceDocsData[i];
        final actual = pieces[i];

        expect(actual!.id, expected['id']);
        // expect(actual.serialNumber, expected['serialNumber']);
        expect(actual.designId, expected['designId']);
        expect(actual.collectionId, expected['collectionId']);
        expect(actual.imageFileNames, expected['imageFileNames']);
      }
    });

    test('fetchAllProductDataFromCloud should fetch complete product data',
        () async {
      setupAllProductsData(
        mockFirestore: mockFirestore,
        mockCollectionReference: mockCollectionReference,
      );

      final Products products =
          await cloudService.fetchAllProductDataFromCloud();

      expect(products.collections.length, mockCollectionDocsData.length);
      expect(products.categories.length, mockCategoryDocsData.length);
      expect(products.designs.length, mockDesignDocsData.length);
      expect(products.pieces.length, mockPieceDocsData.length);
    });
  });
}

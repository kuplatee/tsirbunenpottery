import 'package:flutter_test/flutter_test.dart';
import 'package:tsirbunenpottery/data/products_repository.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';

import '../../utils/mock_cloud_service_helpers.dart';

void main() {
  group('Feature Categories >', () {
    group('CategoriesRepository -', () {
      late CategoriesRepository repository;

      setUp(() {
        repository =
            CategoriesRepository(ProductsRepository(mockCloudServiceWithData()));
      });

      test('loads all 4 categories from the cloud', () async {
        final data = await repository.getData();
        expect(data.categories, hasLength(4));
      });

      test('piecesById contains all 6 pieces', () async {
        final data = await repository.getData();
        expect(data.piecesById, hasLength(6));
      });

      test('designsById contains all 3 designs', () async {
        final data = await repository.getData();
        expect(data.designsById, hasLength(3));
      });

      test('only categories that have pieces appear in categoryDesigns',
          () async {
        final data = await repository.getData();
        // cat-4 (Empty Category) has no pieces → must be absent
        expect(
          data.categoryDesigns.keys,
          containsAll(['cat-1', 'cat-2', 'cat-3']),
        );
        expect(data.categoryDesigns.containsKey('cat-4'), isFalse);
      });

      test('cat-1 (Mugs and Cups) is linked to 2 designs', () async {
        final data = await repository.getData();
        expect(data.categoryDesigns['cat-1'], hasLength(2));
        expect(
          data.categoryDesigns['cat-1']?.keys,
          containsAll(['design-1', 'design-2']),
        );
      });

      test(
          'Soft Linen (design-2) appears in both Mugs and Cups and Kitchen Accessories',
          () async {
        final data = await repository.getData();
        expect(data.categoryDesigns['cat-1']?.containsKey('design-2'), isTrue);
        expect(data.categoryDesigns['cat-3']?.containsKey('design-2'), isTrue);
      });

      test('cat-2 (Plates and Bowls) holds all 3 Salt & Foam pieces',
          () async {
        final data = await repository.getData();
        final pieceIds = data.categoryDesigns['cat-2']?['design-3'];
        expect(pieceIds, containsAll(['pcs-4', 'pcs-5', 'pcs-6']));
      });

      test(
          'imageFileNamesByDesignId accumulates images across all pieces of a design',
          () async {
        final data = await repository.getData();
        // design-2 (Soft Linen) spans 2 pieces, each with 2 images → 4 total
        expect(data.imageFileNamesByDesignId['design-2'], hasLength(4));
        expect(data.imageFileNamesByDesignId['design-2'], containsAll([
          'soft_linen_1.jpg',
          'soft_linen_2.jpg',
          'soft_linen_3.jpg',
          'soft_linen_4.jpg',
        ]));
      });
    });
  });
}

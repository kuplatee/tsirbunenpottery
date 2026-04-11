import 'package:madmudmobile/data/cloud_service.dart';
import '../app/cloud_service/test_data.dart';

/// CloudService stub that returns realistic test data (no Firebase needed).
/// Used in tests that need to exercise real data shaping / UI rendering.
class DataCloudService implements CloudService {
  @override
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  }) async =>
      null;

  @override
  Future<List<Map<String, dynamic>>> fetchMany({
    required String collection,
  }) async =>
      switch (collection) {
        'collections' => mockCollectionDocsData,
        'categories' => mockCategoryDocsData,
        'designs' => mockDesignDocsData,
        'pieces' => mockPieceDocsData,
        _ => [],
      };
}

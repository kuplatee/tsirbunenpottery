import 'package:mockito/mockito.dart';

import '../firebase/firebase_related_mocks.mocks.dart';
import 'test_data.dart';

/// Returns a [MockCloudService] pre-configured with realistic test data.
MockCloudService mockCloudServiceWithData() {
  final mock = MockCloudService();
  when(mock.fetchMany(collection: 'categories'))
      .thenAnswer((_) async => mockCategoryDocsData);
  when(mock.fetchMany(collection: 'collections'))
      .thenAnswer((_) async => mockCollectionDocsData);
  when(mock.fetchMany(collection: 'designs'))
      .thenAnswer((_) async => mockDesignDocsData);
  when(mock.fetchMany(collection: 'pieces'))
      .thenAnswer((_) async => mockPieceDocsData);
  return mock;
}

/// Returns a [MockCloudService] whose [fetchMany] rejects with a network error.
MockCloudService mockCloudServiceFailing() {
  final mock = MockCloudService();
  when(mock.fetchMany(collection: anyNamed('collection')))
      .thenAnswer((_) => Future.error(Exception('Network failure')));
  return mock;
}

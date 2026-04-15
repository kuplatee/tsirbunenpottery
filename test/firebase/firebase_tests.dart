import 'package:flutter_test/flutter_test.dart';
import 'package:madmudmobile/data/firestore_cloud_service.dart';
import 'package:mockito/mockito.dart';
import 'firebase_related_mocks.mocks.dart';

void main() {
  group('Firestore > ', () {
    late MockFirebaseFirestore mockFirestore;
    late MockCollectionReference mockCollectionReference;
    late MockQuerySnapshot mockQuerySnapshot;
    late FirestoreCloudService cloudService;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      mockCollectionReference = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      cloudService = FirestoreCloudService(firestore: mockFirestore);
    });

    group('fetchMany -', () {
      test('returns all documents as maps with id prepended', () async {
        final doc1 = MockQueryDocumentSnapshot();
        when(doc1.id).thenReturn('doc-1');
        when(doc1.data()).thenReturn({'name': 'Alpha'});

        final doc2 = MockQueryDocumentSnapshot();
        when(doc2.id).thenReturn('doc-2');
        when(doc2.data()).thenReturn({'name': 'Beta'});

        when(mockFirestore.collection('items'))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.get())
            .thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([doc1, doc2]);

        final result = await cloudService.fetchMany(collection: 'items');

        expect(result.length, 2);
        expect(result[0], {'id': 'doc-1', 'name': 'Alpha'});
        expect(result[1], {'id': 'doc-2', 'name': 'Beta'});
      });

      test('returns empty list when collection has no documents', () async {
        when(mockFirestore.collection('items'))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.get())
            .thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([]);

        final result = await cloudService.fetchMany(collection: 'items');

        expect(result, isEmpty);
      });
    });

    group('fetchOne -', () {
      test('returns matching document as a map with id prepended', () async {
        final doc1 = MockQueryDocumentSnapshot();
        when(doc1.id).thenReturn('doc-1');
        when(doc1.data()).thenReturn({'name': 'Alpha'});

        final doc2 = MockQueryDocumentSnapshot();
        when(doc2.id).thenReturn('doc-2');
        when(doc2.data()).thenReturn({'name': 'Beta'});

        when(mockFirestore.collection('items'))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.get())
            .thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([doc1, doc2]);

        final result = await cloudService.fetchOne(
          collection: 'items',
          documentId: 'doc-2',
        );

        expect(result, {'id': 'doc-2', 'name': 'Beta'});
      });

      test('returns null when document id is not found', () async {
        final doc1 = MockQueryDocumentSnapshot();
        when(doc1.id).thenReturn('doc-1');
        when(doc1.data()).thenReturn({'name': 'Alpha'});

        when(mockFirestore.collection('items'))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.get())
            .thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([doc1]);

        final result = await cloudService.fetchOne(
          collection: 'items',
          documentId: 'non-existent',
        );

        expect(result, isNull);
      });
    });
  });
}

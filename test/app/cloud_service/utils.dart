import 'dart:convert';
import 'package:madmudmobile/features/categories/domain/models/category/category.dart';
import 'package:madmudmobile/features/collections/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/designs/domain/models/design/design.dart';
import 'package:madmudmobile/localization/languages.dart';
import 'package:mockito/mockito.dart';
import 'cloud_service_mocks.mocks.dart';
import 'test_data.dart';

void prepareMocks(
    String collectionName,
    MockFirebaseFirestore mockFirestore,
    MockCollectionReference mockCollectionReference,
    MockQuerySnapshot snapshot,
    createDocs) {
  when(mockFirestore.collection(collectionName))
      .thenReturn(mockCollectionReference);
  when(mockCollectionReference.get()).thenAnswer((_) async => snapshot);
  final docs = createDocs();
  when(snapshot.docs).thenReturn(docs);
}

List<MockQueryDocumentSnapshot> createMockCategoryDocs() {
  return mockCategoryDocsData.map((docData) {
    final mockDoc = MockQueryDocumentSnapshot();
    when(mockDoc.id).thenReturn(docData['id'] as String);
    when(mockDoc.data()).thenReturn({
      'names': Map<String, dynamic>.from(docData['names'] as Map),
    });
    return mockDoc;
  }).toList();
}

List<Category> categoriesToModels() {
  return mockCategoryDocsData.map((data) {
    return Category(
      id: data['id'] as String,
      names: (data['names'] as Map<String, dynamic>).map((key, value) =>
          MapEntry(
              Language.values
                  .firstWhere((e) => e.toString().split('.').last == key),
              value as String)),
    );
  }).toList();
}

List<MockQueryDocumentSnapshot> createMockCollectionDocs() {
  return mockCollectionDocsData.map((docData) {
    final mockDoc = MockQueryDocumentSnapshot();
    when(mockDoc.id).thenReturn(docData['id'] as String);
    when(mockDoc.data()).thenReturn({
      'names': Map<String, dynamic>.from(docData['names'] as Map),
    });
    return mockDoc;
  }).toList();
}

List<Collection> collectionsToModels() {
  return mockCollectionDocsData.map((data) {
    return Collection(
      id: data['id'] as String,
      description: (data['description'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
              Language.values
                  .firstWhere((e) => e.toString().split('.').last == key),
              value as String)),
      names: (data['names'] as Map<String, dynamic>).map((key, value) =>
          MapEntry(
              Language.values
                  .firstWhere((e) => e.toString().split('.').last == key),
              value as String)),
    );
  }).toList();
}

List<MockQueryDocumentSnapshot> createMockDesignDocs() {
  return mockDesignDocsData.map((docData) {
    final mockDoc = MockQueryDocumentSnapshot();

    // Because we need to create DocumentReferences dynamically
    final mockCategoryRefs = (docData['categoryIds'] as List<String>).map((id) {
      final mockRef = MockDocumentReference<Map<String, dynamic>>();
      when(mockRef.id).thenReturn(id);
      return mockRef; // as DocumentReference<Map<String, dynamic>>;
    }).toList();

    when(mockDoc.id).thenReturn(docData['id'] as String);
    when(mockDoc.data()).thenAnswer((_) => {
          'names': Map<String, dynamic>.from(docData['names'] as Map),
          'categoryIds': mockCategoryRefs,
          'description':
              Map<String, dynamic>.from(docData['description'] as Map),
          'details': Map<String, dynamic>.from(docData['details'] as Map),
        });

    return mockDoc;
  }).toList();
}

List<Design> designsToModels() {
  return mockDesignDocsData.map((data) {
    return Design(
      id: data['id'] as String,
      names: (data['names'] as Map<String, dynamic>).map((key, value) =>
          MapEntry(
              Language.values
                  .firstWhere((e) => e.toString().split('.').last == key),
              value as String)),
      categoryIds: (data['categoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: (data['description'] as Map<String, dynamic>).map(
        (key, value) {
          return MapEntry(
              Language.values
                  .firstWhere((e) => e.toString().split('.').last == key),
              value as String);
        },
      ),
      details: (data['details'] as Map<String, dynamic>).map(
        (key, value) {
          final parsedMap = value as String;
          final convertedMap = jsonDecode(parsedMap) as Map<String, dynamic>;
          return MapEntry(
              Language.values
                  .firstWhere((e) => e.toString().split('.').last == key),
              convertedMap.map((innerKey, innerValue) =>
                  MapEntry(innerKey, innerValue as String)));
        },
      ),
    );
  }).toList();
}

List<MockQueryDocumentSnapshot> createMockPieceDocs() {
  return mockPieceDocsData.map((docData) {
    final mockDoc = MockQueryDocumentSnapshot();

    // Mock DocumentReferences for designId and collectionId
    final mockDesignRef = MockDocumentReference<Map<String, dynamic>>();
    when(mockDesignRef.id).thenReturn(docData['designId'] as String);

    final mockCollectionRef = MockDocumentReference<Map<String, dynamic>>();
    when(mockCollectionRef.id).thenReturn(docData['collectionId'] as String);

    when(mockDoc.id).thenReturn(docData['id'] as String);
    when(mockDoc.data()).thenAnswer((_) => {
          'designId': mockDesignRef,
          'collectionId': mockCollectionRef,
          'imageFileNames':
              List<String>.from(docData['imageFileNames'] as List),
        });

    return mockDoc;
  }).toList();
}

void setupAllProductsData({
  required MockFirebaseFirestore mockFirestore,
  required MockCollectionReference mockCollectionReference,
}) {
  // Make all collection calls return the same mockCollectionReference
  when(mockFirestore.collection('collections'))
      .thenReturn(mockCollectionReference);
  when(mockFirestore.collection('categories'))
      .thenReturn(mockCollectionReference);
  when(mockFirestore.collection('designs')).thenReturn(mockCollectionReference);
  when(mockFirestore.collection('pieces')).thenReturn(mockCollectionReference);

  // Prepare the mock documents
  final mockCollectionsDocs = createMockCollectionDocs();
  final mockCategoriesDocs = createMockCategoryDocs();
  final mockDesignsDocs = createMockDesignDocs();
  final mockPiecesDocs = createMockPieceDocs();

  // Control sequential responses when calling .get()
  int collectionCallCount = 0;
  when(mockCollectionReference.get()).thenAnswer((_) async {
    final snapshot = MockQuerySnapshot();

    switch (collectionCallCount++) {
      case 0:
        when(snapshot.docs).thenReturn(mockCollectionsDocs);
        return snapshot;
      case 1:
        when(snapshot.docs).thenReturn(mockCategoriesDocs);
        return snapshot;
      case 2:
        when(snapshot.docs).thenReturn(mockDesignsDocs);
        return snapshot;
      case 3:
        when(snapshot.docs).thenReturn(mockPiecesDocs);
        return snapshot;
      default:
        throw Exception('Unexpected extra Firestore query');
    }
  });
}

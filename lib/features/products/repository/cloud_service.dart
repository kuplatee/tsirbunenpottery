// import 'package:madmudmobile/features/products/domain/models/category/category.dart';
// import 'package:madmudmobile/features/products/domain/models/collection/collection.dart';
// import 'package:madmudmobile/features/products/domain/models/design/design.dart';
// import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
// import 'package:madmudmobile/features/products/domain/models/products/products.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:madmudmobile/localization/languages.dart';
// import 'dart:convert';

// typedef ObjectDoc = QueryDocumentSnapshot<Object?>;
// typedef DataMap = Map<String, dynamic>;

// class CloudService {
//   final FirebaseFirestore firestore;

//   CloudService({FirebaseFirestore? firestore})
//       : firestore = firestore ?? FirebaseFirestore.instance;

//   Future<Products> fetchAllProductDataFromCloud() async {
//     final collections = await fetchItemsFromCloud<Collection>(
//       path: 'collections',
//       fromDocument: toCollection,
//     );

//     final categories = await fetchItemsFromCloud<Category>(
//       path: 'categories',
//       fromDocument: toCategory,
//     );

//     final designs = await fetchItemsFromCloud<Design>(
//       path: 'designs',
//       fromDocument: (doc) => toDesign(doc, categories),
//     );

//     final pieces = (await fetchItemsFromCloud<Piece?>(
//       path: 'pieces',
//       fromDocument: (doc) => toPiece(doc, designs, collections),
//     ))
//         .whereType<Piece>()
//         .toList();

//     return Products(
//       pieces: pieces,
//       designs: designs,
//       categories: categories,
//       collections: collections,
//     );
//   }

//   Future<List<T>> fetchItemsFromCloud<T>({
//     required String path,
//     required T Function(ObjectDoc doc) fromDocument,
//   }) async {
//     CollectionReference ref = firestore.collection(path);

//     final docs = await ref.get();
//     final items = <T>[];
//     for (var doc in docs.docs) {
//       final item = fromDocument(doc);
//       items.add(item);
//     }

//     return items;
//   }

//   Collection toCollection(ObjectDoc doc) {
//     return Collection(
//         id: doc.id,
//         description: _toStringTranslations(doc.data(), 'description'),
//         names: _toStringTranslations(doc.data(), 'names'));
//   }

//   Category toCategory(ObjectDoc doc) {
//     return Category(
//         id: doc.id, names: _toStringTranslations(doc.data(), 'names'));
//   }

//   Design toDesign(ObjectDoc doc, List<Category> categories) {
//     final data = doc.data() as DataMap;

//     return Design(
//       id: doc.id,
//       names: _toStringTranslations(data, 'names'),
//       categoryIds: _idsOfRefs<Category>(data, categories, 'categoryIds'),
//       description: _toStringTranslations(data, 'description'),
//       details: _toStringMapTranslations(data, 'details'),
//     );
//   }

//   Piece? toPiece(
//       ObjectDoc doc, List<Design> designs, List<Collection> collections) {
//     final data = doc.data() as DataMap;
//     String? designId = _idOfRef<Design>(data, designs, 'designId');
//     if (designId == null) return null;

//     return Piece(
//       id: doc.id,
//       // serialNumber: data['serialNumber'] as int,
//       designId: designId,
//       imageFileNames: ((data['imageFileNames'] ?? []) as List<dynamic>)
//           .map((e) => e as String)
//           .toList(),
//       collectionId: _idOfRef(data, collections, 'collectionId'),
//     );
//   }

//   Map<Language, String> _toStringTranslations(Object? data, String fieldName) {
//     final namesMap = (data as DataMap)[fieldName] as Map<String, dynamic>;

//     return namesMap.map(
//       (key, value) {
//         return MapEntry(
//             Language.values.firstWhere((e) => e.name == key), value as String);
//       },
//     );
//   }

//   Map<Language, Map<String, String>> _toStringMapTranslations(
//       Map<String, dynamic> data, String fieldName) {
//     final detailsRaw = data[fieldName] as Map<String, dynamic>;
//     final Map<Language, Map<String, String>> details = detailsRaw.map(
//       (key, value) {
//         final parsedMap = jsonDecode(value as String) as Map<String, dynamic>;
//         final convertedMap = parsedMap.map(
//           (innerKey, innerValue) => MapEntry(innerKey, innerValue as String),
//         );

//         return MapEntry(
//           Language.values.firstWhere((e) => e.name == key),
//           convertedMap,
//         );
//       },
//     );

//     return details;
//   }

//   List<String> _idsOfRefs<T>(
//     Map<String, dynamic> data,
//     List<T> items,
//     String fieldName,
//   ) {
//     final refs = data[fieldName] as List<dynamic>;
//     final List<String> refIds = refs.map((e) {
//       final ref = e as DocumentReference;
//       return ref.id;
//     }).toList();

//     List<String> existingIds = [];

//     for (final refId in refIds) {
//       final exists = items.any((item) {
//         final itemId = (item as dynamic).id;
//         return itemId == refId;
//       });
//       if (exists) existingIds.add(refId);
//     }

//     return existingIds;
//   }

//   String? _idOfRef<T>(
//       Map<String, dynamic> documentMap, List<T> items, String fieldName) {
//     if (documentMap[fieldName] != null) {
//       final ref = documentMap[fieldName] as DocumentReference;
//       final refId = ref.id;

//       final exists = items.any((item) {
//         final itemId = (item as dynamic).id;
//         return itemId == refId;
//       });

//       if (exists) return refId;
//     }

//     return null;
//   }
// }

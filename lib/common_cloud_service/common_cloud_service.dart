import 'package:cloud_firestore/cloud_firestore.dart';

typedef ObjectDoc = QueryDocumentSnapshot<Object?>;
typedef DataMap = Map<String, dynamic>;

class CommonCloudService {
  final FirebaseFirestore firestore;

  CommonCloudService({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  Future<T?> fetchOneFromCloud<T>({
    required String collectionName,
    required T Function(ObjectDoc doc) fromDocument,
    required String documentId,
  }) async {
    try {
      CollectionReference ref = firestore.collection(collectionName);

      final docs = await ref.get();

      final doc = docs.docs.firstWhere((d) => d.id == documentId);
      return fromDocument(doc);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<T>> fetchManyFromCloud<T>({
    required String collectionName,
    required T Function(ObjectDoc doc) fromDocument,
  }) async {
    try {
      CollectionReference ref = firestore.collection(collectionName);

      final docs = await ref.get();

      final items = <T>[];
      for (var doc in docs.docs) {
        final item = fromDocument(doc);
        items.add(item);
      }

      return items;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

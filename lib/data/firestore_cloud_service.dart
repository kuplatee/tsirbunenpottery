import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsirbunenpottery/data/cloud_service.dart';

class FirestoreCloudService implements CloudService {
  final FirebaseFirestore _firestore;

  FirestoreCloudService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  }) async {
    final ref = _firestore.collection(collection);
    final snapshot = await ref.get();
    final matching = snapshot.docs.where((d) => d.id == documentId);
    if (matching.isEmpty) return null;
    final doc = matching.first;
    return {'id': doc.id, ...doc.data()};
  }

  @override
  Future<List<Map<String, dynamic>>> fetchMany({
    required String collection,
  }) async {
    final ref = _firestore.collection(collection);
    final docs = await ref.get();
    return docs.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }
}

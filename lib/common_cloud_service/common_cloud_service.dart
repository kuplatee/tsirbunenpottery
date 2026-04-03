import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:madmudmobile/common_cloud_service/cloud_service.dart';

class FirestoreCloudService implements CloudService {
  final FirebaseFirestore _firestore;

  FirestoreCloudService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  }) async {
    try {
      final ref = _firestore.collection(collection);
      final docs = await ref.get();
      final doc = docs.docs.firstWhere((d) => d.id == documentId);
      return {'id': doc.id, ...doc.data()};
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchMany({
    required String collection,
  }) async {
    try {
      final ref = _firestore.collection(collection);
      final docs = await ref.get();
      return docs.docs
          .map((doc) => {'id': doc.id, ...doc.data()})
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}

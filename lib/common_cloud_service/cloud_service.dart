abstract interface class CloudService {
  Future<Map<String, dynamic>?> fetchOne({
    required String collection,
    required String documentId,
  });

  Future<List<Map<String, dynamic>>> fetchMany({
    required String collection,
  });
}

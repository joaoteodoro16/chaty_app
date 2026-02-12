abstract class CloudClient {
  Future<void> setDoc({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  });

  Future<Map<String, dynamic>?> getDoc({required String path});

  Future<List<CloudDoc>> whereEquals({
    required String collectionPath,
    required String field,
    required Object? isEqualTo,
    int limit = 1,
  });

  Future<List<CloudDoc>> getCollection({required String collectionPath});

  Future<void> deleteDoc({required String path});

  /// ✅ novo: stream de coleção em tempo real
  Stream<List<CloudDoc>> collectionStream({
    required String collectionPath,
    String? orderByField,
    bool descending = false,
    int? limit,
  });

  /// ✅ novo: add com id automático (pra messageId)
  Future<String> addDoc({
    required String collectionPath,
    required Map<String, dynamic> data,
  });
}


class CloudDoc {
  final String id;
  final Map<String, dynamic> data;

  CloudDoc({required this.id, required this.data});
}

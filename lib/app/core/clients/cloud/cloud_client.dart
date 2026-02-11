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
}

class CloudDoc {
  final String id;
  final Map<String, dynamic> data;

  CloudDoc({required this.id, required this.data});
}

import 'package:chaty_app/app/core/clients/cloud/cloud_client.dart'
    show CloudDoc, CloudClient;
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudClient implements CloudClient {
  final FirebaseFirestore _db;

  FirebaseCloudClient({FirebaseFirestore? db})
    : _db = db ?? FirebaseFirestore.instance;

  @override
  Future<void> setDoc({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    final ref = _db.doc(path);
    await ref.set(data, SetOptions(merge: merge));
  }

  @override
  Future<Map<String, dynamic>?> getDoc({required String path}) async {
    final snap = await _db.doc(path).get();
    if (!snap.exists) return null;
    return _normalize(snap.data()!);
  }

  @override
  Future<List<CloudDoc>> whereEquals({
    required String collectionPath,
    required String field,
    required Object? isEqualTo,
    int limit = 1,
  }) async {
    final q = await _db
        .collection(collectionPath)
        .where(field, isEqualTo: isEqualTo)
        .limit(limit)
        .get();

    return q.docs
        .map((d) => CloudDoc(id: d.id, data: _normalize(d.data())))
        .toList();
  }

  Map<String, dynamic> _normalize(Map<String, dynamic> data) {
    return data.map((key, value) {
      if (value is Timestamp) {
        return MapEntry(key, value.toDate());
      }
      return MapEntry(key, value);
    });
  }

  @override
  Future<List<CloudDoc>> getCollection({required String collectionPath}) async {
    final snapshot = await _db.collection(collectionPath).get();

    return snapshot.docs
        .map((doc) => CloudDoc(id: doc.id, data: _normalize(doc.data())))
        .toList();
  }
  
  @override
  Future<void> deleteDoc({required String path}) async {
    await _db.doc(path).delete();
  }
}

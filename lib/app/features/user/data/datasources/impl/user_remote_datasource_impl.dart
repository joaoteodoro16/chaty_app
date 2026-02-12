import 'package:chaty_app/app/core/clients/cloud/cloud_client.dart';
import 'package:chaty_app/app/features/user/data/datasources/contracts/user_remote_datasource.dart';
import 'package:chaty_app/app/features/user/models/user_document_model.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final CloudClient _cloud;

  UserRemoteDatasourceImpl({required CloudClient cloud}) : _cloud = cloud;

  @override
  Future<void> upsertUser(UserDocumentModel user) async {
    await _cloud.setDoc(
      path: 'users/${user.id}',
      data: user.toMap(),
      merge: true,
    );
  }

  @override
  Future<UserDocumentModel?> getUserById(String uid) async {
    final data = await _cloud.getDoc(path: 'users/$uid');
    if (data == null) return null;

    return UserDocumentModel.fromMap(uid, data);
  }

  @override
  Future<UserDocumentModel?> getUserByEmail(String email) async {
    final docs = await _cloud.whereEquals(
      collectionPath:'users',
      field: 'email',
      isEqualTo: email.trim().toLowerCase(),
      limit: 1,
    );

    if (docs.isEmpty) return null;

    final doc = docs.first;
    return UserDocumentModel.fromMap(doc.id, doc.data);
  }
}

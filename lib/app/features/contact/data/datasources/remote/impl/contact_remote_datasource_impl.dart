import 'package:chaty_app/app/core/clients/cloud/cloud_client.dart';
import 'package:chaty_app/app/features/contact/data/datasources/remote/contracts/contact_remote_datasource.dart';
import 'package:chaty_app/app/features/contact/data/models/contact_document_model.dart';

class ContactRemoteDatasourceImpl extends ContactRemoteDatasource {
  final CloudClient _cloud;

  ContactRemoteDatasourceImpl({required CloudClient cloud}) : _cloud = cloud;

  @override
  Future<void> deleteContact({required String userId,required String contactUserId}) async{
    final path = 'users/$userId/contacts/$contactUserId';
    await _cloud.deleteDoc(path: path);
  }

  @override
  Future<List<ContactDocumentModel>> getContacts({
    required String userId,
  }) async {
    final docs = await _cloud.getCollection(
      collectionPath: 'users/$userId/contacts',
    );
    return docs
        .map((doc) => ContactDocumentModel.fromMap(doc.id, doc.data))
        .toList();
  }

  @override
  Future<void> upsertContact({required String userId,required ContactDocumentModel contact}) async {
    final path = 'users/$userId/contacts/${contact.contactUserId}';

    await _cloud.setDoc(path: path, data: contact.toMap(), merge: true);
  }
}

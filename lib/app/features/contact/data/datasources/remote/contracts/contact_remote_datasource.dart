import 'package:chaty_app/app/features/contact/data/models/contact_document_model.dart';

abstract class ContactRemoteDatasource {
  Future<List<ContactDocumentModel>> getContacts({required String userId});
  Future<void> upsertContact({required String userId,required ContactDocumentModel contact});
  Future<void> deleteContact({required String userId,required String contactUserId});
}

import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';

abstract class ContactRepository {
  Future<List<Contact>> getContacts({required String userId});
  Future<void> upsertContact({required String userId,required Contact contact});
  Future<void> deleteContact({required String userId,required String contactUserId});
}
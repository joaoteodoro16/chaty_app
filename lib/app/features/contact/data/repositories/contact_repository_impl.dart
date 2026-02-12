import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/features/contact/data/datasources/remote/contracts/contact_remote_datasource.dart';
import 'package:chaty_app/app/features/contact/data/models/contact_document_model.dart';
import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';

import '../../domain/repositories/contact_repository.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactRemoteDatasource _remote;

  ContactRepositoryImpl({required ContactRemoteDatasource remote})
    : _remote = remote;

  @override
  Future<List<Contact>> getContacts({required String userId}) async {
    List<Contact> contacts = [];
    final docContacts = await _remote.getContacts(userId: userId);

    for (var e in docContacts) {
      contacts.add(
        Contact(
          id: e.contactUserId,
          surname: e.surname,
          name: e.name,
          email: Email.tryCreate(e.email)!,
        ),
      );
    }
    return contacts;
  }

  @override
  Future<void> upsertContact({required String userId,required Contact contact}) async {
    final document = ContactDocumentModel(
      contactUserId: contact.contactUserId,
      email: contact.email.value,
      name: contact.name,
      surname: contact.surname,
    );
    await _remote.upsertContact(contact: document, userId: userId);
  }
  
  @override
  Future<void> deleteContact({required String userId, required String contactUserId}) async{
    return await _remote.deleteContact(userId: userId, contactUserId: contactUserId);
  }
}

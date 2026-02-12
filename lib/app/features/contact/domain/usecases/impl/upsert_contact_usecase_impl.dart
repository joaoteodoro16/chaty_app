import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:chaty_app/app/features/contact/domain/repositories/contact_repository.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/params/save_contact_params.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';

import '../contracts/upsert_contact_usecase.dart';

class UpsertContactUsecaseImpl extends UpsertContactUsecase {
  final ContactRepository _contactRepository;
  final UserRepository _userRepository;

  UpsertContactUsecaseImpl({
    required ContactRepository contactRepository,
    required UserRepository userRepository,
  }) : _contactRepository = contactRepository,
       _userRepository = userRepository;

  @override
  Future<void> call({
    required String userId,
    required SaveContactParams contact,
  }) async {
    final contactUser = await _userRepository.getUserByEmail(contact.email);

    if(contactUser == null) throw UserNotFoundException(message: "Esse email não está vinculado a nenhuma conta do Chaty");

    final entity = Contact(
      id: contactUser.id!,
      name: contact.name,
      email: Email.tryCreate(contact.email)!,
      surname: contact.surname,
    );
    await _contactRepository.upsertContact(userId: userId, contact: entity);
  }
}

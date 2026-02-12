import 'package:chaty_app/app/features/contact/domain/repositories/contact_repository.dart';

import '../contracts/delete_contact_usecase.dart';

class DeleteContactUsecaseImpl extends DeleteContactUsecase {
  
  final ContactRepository _contactRepository;

  DeleteContactUsecaseImpl({required ContactRepository contactRepository}) : _contactRepository = contactRepository;

  @override
  Future<void> call({required String userId, required String contactUserId}) async{
    await _contactRepository.deleteContact(userId: userId, contactUserId: contactUserId);
  }

}
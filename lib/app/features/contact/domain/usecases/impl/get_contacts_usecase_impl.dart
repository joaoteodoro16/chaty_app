import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:chaty_app/app/features/contact/domain/repositories/contact_repository.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/get_contacts_usecase.dart';

class GetContactsUsecaseImpl extends GetContactsUsecase {
  final ContactRepository _contactRepository;

  GetContactsUsecaseImpl({required ContactRepository repository})
    : _contactRepository = repository;

  @override
  Future<List<Contact>> call({required String userId}) async {
    return await _contactRepository.getContacts(userId: userId);
  }
}

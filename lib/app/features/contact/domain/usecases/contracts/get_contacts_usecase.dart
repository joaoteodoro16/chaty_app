import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';

abstract class GetContactsUsecase {
  Future<List<Contact>> call({required String userId});
}
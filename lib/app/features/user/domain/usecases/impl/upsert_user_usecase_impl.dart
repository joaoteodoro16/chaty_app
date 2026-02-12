import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/upsert_user_usecase.dart';
import 'package:chaty_app/app/features/user/models/user_document_model.dart';

class UpsertUserUsecaseImpl extends UpsertUserUsecase {
  final UserRepository _userRepository;

  UpsertUserUsecaseImpl({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<void> call({required UserAccount user}) async {
    final model = UserDocumentModel(
      id: user.id,
      email: user.email.value,
      name: user.name,
    );
    return _userRepository.upsertUser(model);
  }
}

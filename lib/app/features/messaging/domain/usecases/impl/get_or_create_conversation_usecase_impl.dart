import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/get_or_create_conversation_usecase.dart';


class GetOrCreateConversationUsecaseImpl implements GetOrCreateConversationUsecase {
  final MessagingRepository _repo;

  GetOrCreateConversationUsecaseImpl({required MessagingRepository repo}) :_repo = repo;

  @override
  Future<String> call({
    required String myUid,
    required String otherUid,
    required String myName,
    required String otherName,
  }) {
    return _repo.getOrCreateConversation(
      myUid: myUid,
      otherUid: otherUid,
      myName: myName,
      otherName: otherName,
    );
  }
}

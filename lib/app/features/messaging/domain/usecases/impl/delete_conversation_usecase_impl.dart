import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/delete_conversation_usecase.dart';

class DeleteConversationUsecaseImpl extends DeleteConversationUsecase {
  final MessagingRepository _messagingRepository;
  DeleteConversationUsecaseImpl({required MessagingRepository repository})
    : _messagingRepository = repository;

  @override
  Future<void> call({
    required String myUid,
    required String conversationId,
  }) async {
    await _messagingRepository.deleteConversation(
      myUid: myUid,
      conversationId: conversationId,
    );
  }
}

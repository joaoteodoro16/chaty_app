import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_user_conversations_usecase.dart';

class WatchUserConversationsUsecaseImpl
    implements WatchUserConversationsUsecase {
  final MessagingRepository _repo;

  WatchUserConversationsUsecaseImpl({required MessagingRepository repo})
    : _repo = repo;

  @override
  Stream<List<UserConversation>> call({
    required String userId,
    int limit = 50,
  }) {
    return _repo.watchUserConversations(userId: userId, limit: limit);
  }
}

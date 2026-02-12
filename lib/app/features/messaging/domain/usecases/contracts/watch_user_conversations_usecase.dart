import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';

abstract class WatchUserConversationsUsecase {
  Stream<List<UserConversation>> call({
    required String userId,
    int limit = 50,
  });
}

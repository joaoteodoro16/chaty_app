import 'package:chaty_app/app/features/messaging/domain/entities/message.dart';

abstract class WatchMessagesUsecase {
  Stream<List<Message>> call({
    required String conversationId,
    int limit = 50,
  });
}

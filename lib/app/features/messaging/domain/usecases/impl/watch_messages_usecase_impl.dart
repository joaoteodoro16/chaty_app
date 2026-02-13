import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_messages_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/message.dart';
import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';


class WatchMessagesUsecaseImpl implements WatchMessagesUsecase {
  final MessagingRepository _repo;

  WatchMessagesUsecaseImpl({required MessagingRepository repo}) : _repo = repo;

  @override
  Stream<List<Message>> call({
    required String myUid,
    required String conversationId,
    int limit = 50,
  }) {
    return _repo.watchMessages(
      myUid: myUid,
      conversationId: conversationId,
      limit: limit,
    );
  }
}

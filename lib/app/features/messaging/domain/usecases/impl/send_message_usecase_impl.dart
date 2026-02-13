import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/send_message_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';


class SendMessageUsecaseImpl implements SendMessageUsecase {
  final MessagingRepository _repo;

  SendMessageUsecaseImpl({required MessagingRepository repo}) :_repo = repo;

  @override
  Future<void> call({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
    String? myName,
    String? otherName,
  }) {
    return _repo.sendMessage(
      conversationId: conversationId,
      myUid: myUid,
      otherUid: otherUid,
      text: text,
    );
  }
}

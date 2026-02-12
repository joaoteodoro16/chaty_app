abstract class SendMessageUsecase {
  Future<void> call({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
  });
}

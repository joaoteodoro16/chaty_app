abstract class GetOrCreateConversationUsecase {
  Future<String> call({
    required String myUid,
    required String otherUid,
    required String myName,
    required String otherName,
  });
}

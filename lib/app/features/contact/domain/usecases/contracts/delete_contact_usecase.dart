abstract class DeleteContactUsecase {
  Future<void> call({required String userId,required String contactUserId});
}
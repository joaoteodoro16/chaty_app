import 'package:chaty_app/app/features/contact/domain/usecases/params/save_contact_params.dart';

abstract class UpsertContactUsecase {

  Future<void> call({required String userId,required SaveContactParams contact});

}
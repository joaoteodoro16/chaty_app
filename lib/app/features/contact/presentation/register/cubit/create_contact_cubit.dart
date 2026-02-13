import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/upsert_contact_usecase.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/params/save_contact_params.dart';
import 'package:chaty_app/app/features/contact/presentation/register/cubit/create_contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContactCubit extends Cubit<CreateContactState> {
  final UpsertContactUsecase _upsertContactUsecase;
  final GetUserLoggedUsecase _getUserLoggedUsecase;

  CreateContactCubit({required UpsertContactUsecase upsertContactUsecase, required GetUserLoggedUsecase getUserLoggedUsecase})
    : _upsertContactUsecase = upsertContactUsecase, _getUserLoggedUsecase = getUserLoggedUsecase,
      super(CreateContactState.initial());

  Future<void> save({required SaveContactParams saveContact}) async {
    try {
      emit(CreateContactState.loading());
      final userLogged = await _getUserLoggedUsecase.call();
      await _upsertContactUsecase.call(contact: saveContact, userId: userLogged!.id!);
      emit(CreateContactState.save());
    } on AppException catch (e) {
      emit(CreateContactState.error(message: e.message));
    }catch(e){
      emit(CreateContactState.error(message: "Ocorreu um erro inesperado ao salvar o contato"));
    }
  }
}

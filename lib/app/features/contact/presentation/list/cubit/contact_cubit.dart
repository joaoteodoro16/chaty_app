import 'package:chaty_app/app/core/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/delete_contact_usecase.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/get_contacts_usecase.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<ContactState> {
  final GetUserLoggedUsecase _getUserLoggedUsecase;
  final GetContactsUsecase _getContactsUsecase;
  final DeleteContactUsecase _deleteContactUsecase;

  ContactCubit({
    required GetUserLoggedUsecase getUserLoggedUsecase,
    required GetContactsUsecase getContactsUsecase,
    required DeleteContactUsecase deleteContactUsecase,
  }) : _getContactsUsecase = getContactsUsecase,
       _getUserLoggedUsecase = getUserLoggedUsecase,
       _deleteContactUsecase = deleteContactUsecase,
       super(ContactState.initial());

  Future<void> getContacts() async {
    try {
      emit(ContactState.loading());
      final userLogged = await _getUserLoggedUsecase.call();
      final contacts = await _getContactsUsecase.call(userId: userLogged.id!);
      emit(ContactState.loaded(contacts: contacts));
    } on AppException catch (e) {
      emit(ContactState.error(message: e.message));
    } catch (e) {
      emit(
        ContactState.error(
          message: 'Ocorreu um erro inesperado ao buscar os contatos',
        ),
      );
    }
  }

  Future<void> deleteContact({required String contactUserId}) async {
    try {
      emit(ContactState.loading());
      final userLogged = await _getUserLoggedUsecase.call();
      await _deleteContactUsecase.call(
        userId: userLogged.id!,
        contactUserId: contactUserId,
      );
      emit(ContactState.deletedContact());
    } on AppException catch (e) {
      emit(ContactState.error(message: e.message));
    }catch(e){
      emit(ContactState.error(message: "Ocorreu um erro inesperado ao deletar o contato"));
    }
  }
}

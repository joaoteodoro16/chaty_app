import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/delete_contact_usecase.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/get_contacts_usecase.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_state.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/get_or_create_conversation_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<ContactState> {
  final GetUserLoggedUsecase _getUserLoggedUsecase;
  final GetContactsUsecase _getContactsUsecase;
  final DeleteContactUsecase _deleteContactUsecase;
  final GetOrCreateConversationUsecase _getOrCreateConversationUsecase;

  ContactCubit({
    required GetUserLoggedUsecase getUserLoggedUsecase,
    required GetContactsUsecase getContactsUsecase,
    required DeleteContactUsecase deleteContactUsecase,
    required GetOrCreateConversationUsecase getOrCreateConversationUsecase,
  }) : _getContactsUsecase = getContactsUsecase,
       _getUserLoggedUsecase = getUserLoggedUsecase,
       _deleteContactUsecase = deleteContactUsecase,
       _getOrCreateConversationUsecase = getOrCreateConversationUsecase,
       super(ContactState.initial());

  List<Contact> _allContacts = [];

  Future<void> getContacts() async {
    try {
      emit(ContactState.loading());
      final userLogged = await _getUserLoggedUsecase.call();
      final contacts = await _getContactsUsecase.call(userId: userLogged!.id!);
      _allContacts = contacts;
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

  void filterContactsByName({required String name}) {
    final filtered = _allContacts
        .where(
          (contact) => contact.name.toLowerCase().contains(name.toLowerCase()),
        )
        .toList();

    emit(ContactState.loaded(contacts: filtered));
  }

  void clearFilter() {
    emit(ContactState.loaded(contacts: _allContacts));
  }

  Future<void> deleteContact({required String contactUserId}) async {
    try {
      emit(ContactState.loading());
      final userLogged = await _getUserLoggedUsecase.call();
      await _deleteContactUsecase.call(
        userId: userLogged!.id!,
        contactUserId: contactUserId,
      );
      emit(ContactState.deletedContact());
    } on AppException catch (e) {
      emit(ContactState.error(message: e.message));
    } catch (e) {
      emit(
        ContactState.error(
          message: "Ocorreu um erro inesperado ao deletar o contato",
        ),
      );
    }
  }

  Future<void> openOrCreateConversation({
    required String contactUserId,
    required String contactName,
  }) async {
    try {
      emit(ContactState.loading());
      final userLogged = await _getUserLoggedUsecase.call();

      final conversationId = await _getOrCreateConversationUsecase.call(
        myUid: userLogged!.id!,
        otherUid: contactUserId,
        myName: userLogged.name,
        otherName: contactName,
      );

      emit(
        ContactState.openChat(
          conversationId: conversationId,
          otherUserId: contactUserId,
          otherUserName: contactName,
        ),
      );
    } on AppException catch (e) {
      emit(ContactState.error(message: e.message));
    } catch (_) {
      emit(
        ContactState.error(
          message: "Ocorreu um erro inesperado ao abrir a conversa",
        ),
      );
    }
  }
}

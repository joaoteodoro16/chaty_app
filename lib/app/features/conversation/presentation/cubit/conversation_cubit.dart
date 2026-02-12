import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/conversation/domain/usecases/contracts/logout_usecase.dart';
import 'package:chaty_app/app/features/conversation/presentation/cubit/conversation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationCubit extends Cubit<ConversationState> {
  final LogoutUsecase _logoutUsecase;

  ConversationCubit({required LogoutUsecase logoutUsecase})
    : _logoutUsecase = logoutUsecase,
      super(ConversationState.initial());

  Future<void> logout() async {
    try {
      emit(ConversationState.loading());
      await _logoutUsecase.call();
      emit(ConversationState.loaded());
    } on AppException catch (e) {
      emit(ConversationState.erro(message: e.message));
    }catch(e){
      emit(ConversationState.erro(message: "Ocorreu um erro inesperado ao realizar o logout"));
    }
  }
}

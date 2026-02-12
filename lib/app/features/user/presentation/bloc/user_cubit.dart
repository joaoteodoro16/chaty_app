import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/get_user_by_id_usecase.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/upsert_user_usecase.dart';
import 'package:chaty_app/app/features/user/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UpsertUserUsecase _upsertUserUsecase;
  final GetUserByIdUsecase _getUserByIdUsecase;

  UserCubit({
    required UpsertUserUsecase upsertUsecase,
    required GetUserByIdUsecase getUserByIdUsecase,
  }) : _upsertUserUsecase = upsertUsecase,
       _getUserByIdUsecase = getUserByIdUsecase,
       super(UserState.initial());

  Future<void> getUser() async {
    try {
      emit(UserState.loading());
      final user = await _getUserByIdUsecase.call();
      emit(UserState.loadedUser(user: user));
    } on AppException catch (e) {
      emit(UserState.error(message: e.message));
    }catch(e){
      emit(UserState.error(message: "Ocorreu um erro inesperado ao buscar as informações do usuário"));
    }
  }
}

import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/get_user_by_id_usecase.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/upsert_user_usecase.dart';
import 'package:chaty_app/app/features/user/domain/usecases/params/save_user_params.dart';
import 'package:chaty_app/app/features/user/presentation/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UpsertUserUsecase _upsertUserUsecase;
  final GetUserLoggedUsecase _getUserLoggedUsecase;
  final GetUserByIdUsecase _getUserByIdUsecase;

  UserAccount? _currentUser;

  UserCubit({
    required UpsertUserUsecase upsertUsecase,
    required GetUserByIdUsecase getUserByIdUsecase,
    required GetUserLoggedUsecase getUserLoggedUsecase,
  }) : _upsertUserUsecase = upsertUsecase,
       _getUserByIdUsecase = getUserByIdUsecase,
       _getUserLoggedUsecase = getUserLoggedUsecase,
       super(UserState.initial());

  Future<void> getUser() async {
    try {
      emit(UserState.loading());
      final userLogged = await _getUserLoggedUsecase.call();
      final user = await _getUserByIdUsecase.call(userId: userLogged.id!);
      _currentUser = user;
      emit(UserState.loadedUser(user: user));
    } on AppException catch (e) {
      emit(UserState.error(message: e.message));
    } catch (e) {
      emit(
        UserState.error(
          message:
              "Ocorreu um erro inesperado ao buscar as informações do usuário",
        ),
      );
    }
  }

  Future<void> save({required SaveUserParams params}) async {
    try {
      emit(UserState.loading());
      _currentUser = _currentUser!.rename(params.name);
      await _upsertUserUsecase.call(user: _currentUser!);
      emit(UserState.save(message: "Usuário atualizado com sucesso!"));
    } on AppException catch (e) {
      emit(UserState.error(message: e.message));
    } catch (e) {
      emit(
        UserState.error(
          message: "Ocorreu um erro inesperado ao salvar o usuário",
        ),
      );
    }
  }
}

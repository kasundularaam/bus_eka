import 'package:bloc/bloc.dart';
import 'package:bus_eka/services/api_services/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      emit(LoginLoading());
      await AuthRepo.loginUser(email: email, password: password);
      emit(LoginSucceed());
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }

  Future<void> signUpUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      emit(LoginLoading());
      await AuthRepo.signUpUser(email: email, password: password, name: name);
      emit(LoginSucceed());
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}

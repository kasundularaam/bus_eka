import 'package:bloc/bloc.dart';
import 'package:bus_eka/data/models/user_model.dart';
import 'package:bus_eka/services/api_services/auth_repo.dart';
import 'package:bus_eka/services/local_services/auth_credentials.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> checkUser() async {
    try {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));
      String userId = await AuthCredentials.getUser();
      if (userId != AuthCredentials.noUser) {
        UserModel userModel = await AuthRepo.getUserById(userId: userId);
        emit(AuthSucceed(userModel: userModel));
      } else {
        emit(AuthLogin());
      }
    } catch (e) {
      emit(AuthFailed(errorMsg: e.toString()));
    }
  }
}

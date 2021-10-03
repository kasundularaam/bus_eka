part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLogin extends AuthState {}

class AuthSignup extends AuthState {}

class AuthSucceed extends AuthState {
  final UserModel userModel;
  AuthSucceed({
    required this.userModel,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthSucceed && other.userModel == userModel;
  }

  @override
  int get hashCode => userModel.hashCode;

  @override
  String toString() => 'AuthSucceed(userModel: $userModel)';
}

class AuthFailed extends AuthState {
  final String errorMsg;
  AuthFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'AuthFailed(errorMsg: $errorMsg)';
}

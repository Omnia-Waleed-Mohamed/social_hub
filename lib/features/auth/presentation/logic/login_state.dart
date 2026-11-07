import 'package:social_hub/features/auth/domain/entities/login_failure.dart';
import 'package:social_hub/features/auth/domain/entities/user_entity.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess(this.user);

  final UserEntity user;
}

class LoginFailureState extends LoginState {
  const LoginFailureState(this.failure);

  final LoginFailure failure;
}
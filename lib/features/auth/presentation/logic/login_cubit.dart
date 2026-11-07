import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/features/auth/domain/entities/login_failure.dart';
import 'package:social_hub/features/auth/domain/use_cases/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    if (isClosed) return;

    emit(const LoginLoading());

    try {
      final user = await _loginUseCase(
        username: username,
        password: password,
      );

      if (isClosed) return;

      emit(LoginSuccess(user));
    } on LoginException catch (error) {
      if (isClosed) return;

      emit(LoginFailureState(error.failure));
    } catch (_) {
      if (isClosed) return;

      emit(
        const LoginFailureState(LoginFailure.unexpected),
      );
    }
  }
}
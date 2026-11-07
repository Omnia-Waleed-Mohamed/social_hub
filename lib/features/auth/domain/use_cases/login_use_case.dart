import 'package:social_hub/features/auth/domain/entities/user_entity.dart';
import 'package:social_hub/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<UserEntity> call({
    required String username,
    required String password,
  }) {
    return _repository.login(
      username: username,
      password: password,
    );
  }
}
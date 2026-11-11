import 'package:social_hub/features/users/domain/entities/user_entity.dart';
import 'package:social_hub/features/users/domain/repository/users_repository.dart';

class GetUsersUseCase {
  const GetUsersUseCase(this.repository);

  final UsersRepository repository;

  Future<List<UserEntity>> call() {
    return repository.getUsers();
  }
}

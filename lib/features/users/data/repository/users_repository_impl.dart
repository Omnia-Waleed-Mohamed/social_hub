import 'package:social_hub/features/users/data/data_source/users_local_data_source.dart';
import 'package:social_hub/features/users/data/data_source/users_remote_data_source.dart';
import 'package:social_hub/features/users/domain/entities/user_entity.dart';
import 'package:social_hub/features/users/domain/repository/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final UsersRemoteDataSource remoteDataSource;
  final UsersLocalDataSource localDataSource;

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      final users = await remoteDataSource.fetchUsers();

      await localDataSource.cacheUsers(users);

      return users;
    } catch (error) {
      final cachedUsers = localDataSource.getCachedUsers();

      if (cachedUsers.isNotEmpty) {
        return cachedUsers;
      }

      rethrow;
    }
  }
}

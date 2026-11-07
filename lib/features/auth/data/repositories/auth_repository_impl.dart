import 'package:dio/dio.dart';
import 'package:social_hub/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:social_hub/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:social_hub/features/auth/domain/entities/login_failure.dart';
import 'package:social_hub/features/auth/domain/entities/user_entity.dart';
import 'package:social_hub/features/auth/domain/repositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<UserEntity> login({
    required String username,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.login(
        username: username,
        password: password,
      );

      await _localDataSource.saveUserId(user.id);

      return user;
    } on LoginException {
      rethrow;
    } on DioException catch (error) {
      if (error.response != null) {
        throw const LoginException(LoginFailure.server);
      }

      throw const LoginException(LoginFailure.network);
    } catch (_) {
      throw const LoginException(LoginFailure.unexpected);
    }
  }
}
import 'package:dio/dio.dart';
import 'package:social_hub/features/auth/data/models/user_model.dart';
import 'package:social_hub/features/auth/domain/entities/login_failure.dart';


abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final response = await _dio.get('/users');

    final users = response.data as List<dynamic>;

    final matchingUsers = users
        .map(
          (user) => UserModel.fromJson(
            user as Map<String, dynamic>,
          ),
        )
        .where(
          (user) =>
              user.username.toLowerCase() == username.trim().toLowerCase() &&
              user.id.toString() == password.trim(),
        );

    if (matchingUsers.isEmpty) {
      throw const LoginException(
        LoginFailure.invalidCredentials,
      );
    }

    return matchingUsers.first;
  }
}
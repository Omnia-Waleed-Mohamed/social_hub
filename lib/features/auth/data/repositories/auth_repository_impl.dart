import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
      debugPrint('========== DIO ERROR ==========');
      debugPrint('Error Type: ${error.type}');
      debugPrint('Error Message: ${error.message}');
      debugPrint('Error Details: ${error.error}');
      debugPrint('Request URL: ${error.requestOptions.uri}');
      debugPrint('Status Code: ${error.response?.statusCode}');
      debugPrint('Response: ${error.response?.data}');
      debugPrint('================================');

      if (error.response != null) {
        throw const LoginException(LoginFailure.server);
      }

      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        throw const LoginException(LoginFailure.timeout);
      }

      if (error.type == DioExceptionType.connectionError ||
          error.error is SocketException ||
          error.message?.toLowerCase().contains('network') == true ||
          error.message?.toLowerCase().contains('no address') == true) {
        throw const LoginException(LoginFailure.noInternet);
      }

      if (error.error is HandshakeException ||
          error.message?.toLowerCase().contains('handshake') == true ||
          error.message?.toLowerCase().contains('tls') == true ||
          error.message?.toLowerCase().contains('certificate') == true) {
        throw const LoginException(LoginFailure.sslHandshake);
      }

      throw const LoginException(LoginFailure.unexpected);
    } catch (error, stackTrace) {
      debugPrint('========== UNEXPECTED ERROR ==========');
      debugPrint('Error: $error');
      debugPrint('Stack Trace: $stackTrace');
      debugPrint('======================================');

      throw const LoginException(LoginFailure.unexpected);
    }
  }
}

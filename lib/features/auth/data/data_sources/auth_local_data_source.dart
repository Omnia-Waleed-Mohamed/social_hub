import 'package:social_hub/core/storage/session_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserId(int userId);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._sessionStorage);

  final SessionStorage _sessionStorage;

  @override
  Future<void> saveUserId(int userId) {
    return _sessionStorage.saveUserId(userId);
  }
}
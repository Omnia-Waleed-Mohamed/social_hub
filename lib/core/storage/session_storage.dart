import 'package:hive_ce/hive.dart';

abstract class SessionStorage {
  Future<void> saveUserId(int userId);

  int? getUserId();

  Future<void> clearSession();
}

class SessionStorageImpl implements SessionStorage {
  SessionStorageImpl(this._box);

  final Box<dynamic> _box;

  static const String _userIdKey = 'user_id';

  @override
  Future<void> saveUserId(int userId) async {
    await _box.put(_userIdKey, userId);
  }

  @override
  int? getUserId() {
    return _box.get(_userIdKey) as int?;
  }

  @override
  Future<void> clearSession() async {
    await _box.delete(_userIdKey);
  }
}
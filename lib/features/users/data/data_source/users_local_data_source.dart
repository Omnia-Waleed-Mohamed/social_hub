import 'package:hive_ce/hive.dart';
import 'package:social_hub/features/users/data/models/user_model.dart';

class UsersLocalDataSource {
  UsersLocalDataSource(this.box);

  final Box<dynamic> box;

  static const String cachedUsersKey = 'cached_users';

  Future<void> cacheUsers(List<UserModel> users) async {
    final usersJson = users
        .map((user) => user.toJson())
        .toList();

    await box.put(cachedUsersKey, usersJson);
  }

  List<UserModel> getCachedUsers() {
    final cachedData = box.get(cachedUsersKey);

    if (cachedData == null) {
      return [];
    }

    final usersJson = List<Map<String, dynamic>>.from(
      (cachedData as List).map(
        (item) => Map<String, dynamic>.from(item as Map),
      ),
    );

    return usersJson
        .map(UserModel.fromCache)
        .toList();
  }
}

import 'package:social_hub/core/constants/api_constants.dart';
import 'package:social_hub/core/network/dio_client.dart';
import 'package:social_hub/features/users/data/models/user_model.dart';

class UsersRemoteDataSource {
  UsersRemoteDataSource(this.dioClient);

  final DioClient dioClient;

  Future<List<UserModel>> fetchUsers() async {
    final response = await dioClient.dio.get(ApiConstants.users);

    final data = response.data as List<dynamic>;

    return data
        .map(
          (item) => UserModel.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}

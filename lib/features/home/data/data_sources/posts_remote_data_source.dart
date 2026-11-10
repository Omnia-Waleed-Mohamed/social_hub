import 'package:dio/dio.dart';
import 'package:social_hub/core/constants/api_constants.dart';
import 'package:social_hub/features/home/data/models/post_model.dart';
import 'package:social_hub/features/home/data/models/user_model.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> fetchPosts();

  Future<List<UserModel>> fetchUsers();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  PostsRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<PostModel>> fetchPosts() async {
    final response = await dio.get(ApiConstants.posts);

    final data = response.data as List<dynamic>;

    return data
        .map(
          (item) => PostModel.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<List<UserModel>> fetchUsers() async {
    final response = await dio.get(ApiConstants.users);

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
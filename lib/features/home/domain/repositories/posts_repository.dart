import 'package:social_hub/features/home/domain/entities/post_entity.dart';

abstract class PostsRepository {
  Future<List<PostEntity>> getPosts();
}
import 'package:social_hub/features/home/domain/entities/post_entity.dart';
import 'package:social_hub/features/home/domain/repositories/posts_repository.dart';

class GetPostsUseCase {
  const GetPostsUseCase(this.repository);

  final PostsRepository repository;

  Future<List<PostEntity>> call() {
    return repository.getPosts();
  }
}
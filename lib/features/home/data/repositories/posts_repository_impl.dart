import 'package:social_hub/features/home/data/data_sources/posts_local_data_source.dart';
import 'package:social_hub/features/home/data/data_sources/posts_remote_data_source.dart';
import 'package:social_hub/features/home/data/models/post_model.dart';
import 'package:social_hub/features/home/data/models/user_model.dart';
import 'package:social_hub/features/home/domain/entities/post_entity.dart';
import 'package:social_hub/features/home/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final PostsRemoteDataSource remoteDataSource;
  final PostsLocalDataSource localDataSource;

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      final posts = await remoteDataSource.fetchPosts();
      final users = await remoteDataSource.fetchUsers();

      final Map<int, UserModel> usersMap = {
        for (final user in users) user.id: user,
      };

      final postsWithAuthors = posts.map((post) {
        final user = usersMap[post.userId];

        return PostModel(
          id: post.id,
          userId: post.userId,
          title: post.title,
          body: post.body,
          authorName: user?.name ?? '',
          authorUsername: user?.username ?? '',
        );
      }).toList();

      await localDataSource.cachePosts(postsWithAuthors);

      return postsWithAuthors;
    } catch (_) {
      final cachedPosts = localDataSource.getCachedPosts();

      if (cachedPosts.isNotEmpty) {
        return cachedPosts;
      }

      rethrow;
    }
  }
}
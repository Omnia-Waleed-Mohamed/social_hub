import 'package:hive_ce/hive.dart';
import 'package:social_hub/features/home/data/models/post_model.dart';

abstract class PostsLocalDataSource {
  Future<void> cachePosts(List<PostModel> posts);

  List<PostModel> getCachedPosts();
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  PostsLocalDataSourceImpl(this.box);

  final Box<dynamic> box;

  static const String _postsKey = 'cached_posts';

  @override
  Future<void> cachePosts(List<PostModel> posts) async {
    final data = posts.map((post) => post.toJson()).toList();

    await box.put(_postsKey, data);
  }

  @override
  List<PostModel> getCachedPosts() {
    final cachedData = box.get(_postsKey);

    if (cachedData == null) {
      return [];
    }

    return (cachedData as List)
        .map(
          (item) => PostModel.fromCache(
            Map<String, dynamic>.from(item as Map),
          ),
        )
        .toList();
  }
}
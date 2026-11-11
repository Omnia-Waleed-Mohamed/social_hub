import 'package:hive_ce/hive.dart';
import 'package:social_hub/features/albums/data/models/album_model.dart';

class AlbumsLocalDataSource {
  AlbumsLocalDataSource(this.box);

  final Box<dynamic> box;

  static const String _cacheKey = 'cached_albums';

  Future<void> cacheAlbums(List<AlbumModel> albums) async {
    final data = albums.map((album) => album.toJson()).toList();

    await box.put(_cacheKey, data);
  }

  List<AlbumModel> getCachedAlbums() {
    final cachedData = box.get(_cacheKey);

    if (cachedData == null) {
      return [];
    }

    return (cachedData as List).map((album) {
      return AlbumModel.fromJson(
        Map<String, dynamic>.from(album as Map),
      );
    }).toList();
  }
}
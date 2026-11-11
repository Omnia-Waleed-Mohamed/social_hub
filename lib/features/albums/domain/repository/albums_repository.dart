import 'package:social_hub/features/albums/domain/entities/album_entity.dart';

abstract class AlbumsRepository {
  Future<List<AlbumEntity>> getAlbums();
}
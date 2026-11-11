import 'package:social_hub/features/albums/data/data_source/albums_local_data_source.dart';
import 'package:social_hub/features/albums/data/data_source/albums_remote_data_source.dart';
import 'package:social_hub/features/albums/domain/entities/album_entity.dart';
import 'package:social_hub/features/albums/domain/repository/albums_repository.dart';

class AlbumsRepositoryImpl implements AlbumsRepository {
  AlbumsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final AlbumsRemoteDataSource remoteDataSource;
  final AlbumsLocalDataSource localDataSource;

  @override
  Future<List<AlbumEntity>> getAlbums() async {
    try {
      final albums = await remoteDataSource.fetchAlbums();

      await localDataSource.cacheAlbums(albums);

      return albums;
    } catch (error) {
      final cachedAlbums = localDataSource.getCachedAlbums();

      if (cachedAlbums.isNotEmpty) {
        return cachedAlbums;
      }

      rethrow;
    }
  }
}
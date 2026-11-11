import 'package:social_hub/features/albums/domain/entities/album_entity.dart';
import 'package:social_hub/features/albums/domain/repository/albums_repository.dart';

class GetAlbumsUseCase {
  const GetAlbumsUseCase(this.repository);

  final AlbumsRepository repository;

  Future<List<AlbumEntity>> call() {
    return repository.getAlbums();
  }
}
import 'package:social_hub/core/constants/api_constants.dart';
import 'package:social_hub/core/network/dio_client.dart';
import 'package:social_hub/features/albums/data/models/album_model.dart';

class AlbumsRemoteDataSource {
  AlbumsRemoteDataSource(this.dioClient);

  final DioClient dioClient;

  Future<List<AlbumModel>> fetchAlbums() async {
    final responses = await Future.wait([
      dioClient.dio.get(ApiConstants.albums),
      dioClient.dio.get(ApiConstants.photos),
    ]);

    final albumsData = responses[0].data as List<dynamic>;
    final photosData = responses[1].data as List<dynamic>;

    final Map<int, String> albumCovers = {};

    for (final photo in photosData) {
      final photoData = photo as Map<String, dynamic>;
      final albumId = photoData['albumId'] as int;

      albumCovers.putIfAbsent(
        albumId,
        () => photoData['thumbnailUrl'] as String? ?? '',
      );
    }

    return albumsData.map((album) {
      final albumData = album as Map<String, dynamic>;
      final albumId = albumData['id'] as int;

      return AlbumModel.fromJson(
        albumData,
        coverImageUrl: albumCovers[albumId],
      );
    }).toList();
  }
}
import 'package:social_hub/features/albums/domain/entities/album_entity.dart';

sealed class AlbumsState {
  const AlbumsState();
}

class AlbumsInitial extends AlbumsState {
  const AlbumsInitial();
}

class AlbumsLoading extends AlbumsState {
  const AlbumsLoading();
}

class AlbumsSuccess extends AlbumsState {
  const AlbumsSuccess({
    required this.albums,
    required this.filteredAlbums,
    this.query = '',
  });

  final List<AlbumEntity> albums;
  final List<AlbumEntity> filteredAlbums;
  final String query;
}

class AlbumsFailure extends AlbumsState {
  const AlbumsFailure();
}
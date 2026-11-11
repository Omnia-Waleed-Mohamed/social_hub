import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/features/albums/domain/entities/album_entity.dart';
import 'package:social_hub/features/albums/domain/use_case/get_albums_use_case.dart';
import 'package:social_hub/features/albums/presentation/logic/albums_state.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  AlbumsCubit(this.getAlbumsUseCase) : super(const AlbumsInitial());

  final GetAlbumsUseCase getAlbumsUseCase;

  List<AlbumEntity> _albums = [];

  Future<void> loadAlbums() async {
    emit(const AlbumsLoading());

    try {
      _albums = await getAlbumsUseCase();

      emit(
        AlbumsSuccess(
          albums: _albums,
          filteredAlbums: _albums,
        ),
      );
    } catch (_) {
      emit(const AlbumsFailure());
    }
  }

  Future<void> refreshAlbums() async {
    final currentQuery = state is AlbumsSuccess
        ? (state as AlbumsSuccess).query
        : '';

    try {
      _albums = await getAlbumsUseCase();

      _emitFilteredAlbums(currentQuery);
    } catch (_) {
      if (state is! AlbumsSuccess) {
        emit(const AlbumsFailure());
      }
    }
  }

  void searchAlbums(String query) {
    _emitFilteredAlbums(query);
  }

  void _emitFilteredAlbums(String query) {
    final normalizedQuery = query.trim().toLowerCase();

    final filteredAlbums = _albums.where((album) {
      return album.title.toLowerCase().contains(normalizedQuery) ||
          album.id.toString().contains(normalizedQuery) ||
          album.userId.toString().contains(normalizedQuery);
    }).toList();

    emit(
      AlbumsSuccess(
        albums: _albums,
        filteredAlbums: filteredAlbums,
        query: query,
      ),
    );
  }
}
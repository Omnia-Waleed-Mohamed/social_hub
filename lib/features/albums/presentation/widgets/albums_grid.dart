import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/albums_dimensions.dart';
import 'package:social_hub/features/albums/domain/entities/album_entity.dart';
import 'package:social_hub/features/albums/presentation/widgets/album_card.dart';

class AlbumsGrid extends StatelessWidget {
  const AlbumsGrid({
    required this.albums,
    required this.onRefresh,
    super.key,
  });

  final List<AlbumEntity> albums;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: albums.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AlbumsDimensions.gridColumns,
          crossAxisSpacing: AlbumsDimensions.gridSpacing,
          mainAxisSpacing: AlbumsDimensions.gridSpacing,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return AlbumCard(album: albums[index]);
        },
      ),
    );
  }
}

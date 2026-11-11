import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/albums_dimensions.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/features/albums/domain/entities/album_entity.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    required this.album,
    super.key,
  });

  final AlbumEntity album;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AlbumsDimensions.cardRadius,
        ),
        side: BorderSide(
          color: colorScheme.outlineVariant,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(
          AlbumsDimensions.cardPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: AlbumsDimensions.imageAspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AlbumsDimensions.imageRadius,
                ),
                child: _buildCover(colorScheme),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              album.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCover(ColorScheme colorScheme) {
    if (album.coverImageUrl.isEmpty) {
      debugPrint('Empty image URL for album: ${album.id}');

      return ColoredBox(
        color: colorScheme.surfaceContainerHighest,
        child: Icon(
          Icons.photo_outlined,
          size: AlbumsDimensions.iconSize * 2,
          color: colorScheme.onSurfaceVariant,
        ),
      );
    }

    debugPrint(
      'Album ${album.id} image URL: ${album.coverImageUrl}',
    );

    return CachedNetworkImage(
      imageUrl: album.coverImageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => ColoredBox(
        color: colorScheme.surfaceContainerHighest,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) {
        debugPrint('Image loading error: $error');

        return ColoredBox(
          color: colorScheme.surfaceContainerHighest,
          child: Icon(
            Icons.broken_image_outlined,
            color: colorScheme.onSurfaceVariant,
          ),
        );
      },
    );
  }
}

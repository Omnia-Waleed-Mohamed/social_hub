import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/core/dependency_injection/service_locator.dart';
import 'package:social_hub/features/albums/presentation/logic/albums_cubit.dart';
import 'package:social_hub/features/albums/presentation/logic/albums_state.dart';
import 'package:social_hub/features/albums/presentation/widgets/albums_grid.dart';
import 'package:social_hub/features/albums/presentation/widgets/albums_header.dart';
import 'package:social_hub/features/albums/presentation/widgets/albums_search_field.dart';
import 'package:social_hub/generated/l10n.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AlbumsCubit>()..loadAlbums(),
      child: const _AlbumsView(),
    );
  }
}

class _AlbumsView extends StatelessWidget {
  const _AlbumsView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).albums),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AlbumsHeader(),
            const SizedBox(height: AppSpacing.lg),
            AlbumsSearchField(
              onChanged: context.read<AlbumsCubit>().searchAlbums,
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: BlocBuilder<AlbumsCubit, AlbumsState>(
                builder: (context, state) {
                  if (state is AlbumsLoading ||
                      state is AlbumsInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is AlbumsFailure) {
                    return _AlbumsError(
                      onRetry: context.read<AlbumsCubit>().loadAlbums,
                    );
                  }

                  if (state is AlbumsSuccess) {
                    if (state.filteredAlbums.isEmpty) {
                      return Center(
                        child: Text(
                          state.query.isEmpty
                              ? S.of(context).noAlbums
                              : S.of(context).noAlbumsFound,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      );
                    }

                    return AlbumsGrid(
                      albums: state.filteredAlbums,
                      onRefresh: context.read<AlbumsCubit>().refreshAlbums,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlbumsError extends StatelessWidget {
  const _AlbumsError({
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cloud_off_outlined,
            size: 48,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            S.of(context).albumsLoadError,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton(
            onPressed: onRetry,
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }
}
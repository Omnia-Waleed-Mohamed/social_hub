import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/core/dependency_injection/service_locator.dart';
import 'package:social_hub/features/home/presentation/logic/home_cubit.dart';
import 'package:social_hub/features/home/presentation/logic/home_state.dart';
import 'package:social_hub/features/home/presentation/widgets/home_header.dart';
import 'package:social_hub/features/home/presentation/widgets/posts_list.dart';
import 'package:social_hub/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..loadPosts(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).social,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            tooltip: S.of(context).search,
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),

              const HomeHeader(),

              const SizedBox(height: AppSpacing.lg),

              Text(
                S.of(context).postsTitle,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading ||
                        state is HomeInitial) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is HomeFailure) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.wifi_off,
                              size: 40,
                              color: colorScheme.error,
                            ),

                            const SizedBox(height: AppSpacing.md),

                            Text(
                              S.of(context).postsLoadError,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium,
                            ),

                            const SizedBox(height: AppSpacing.md),

                            FilledButton(
                              onPressed: () {
                                context.read<HomeCubit>().loadPosts();
                              },
                              child: Text(
                                S.of(context).retry,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is HomeSuccess) {
                      if (state.posts.isEmpty) {
                        return Center(
                          child: Text(
                            S.of(context).noPosts,
                            style: textTheme.bodyMedium,
                          ),
                        );
                      }

                      return PostsList(
                        posts: state.posts,
                        onRefresh: () {
                          return context
                              .read<HomeCubit>()
                              .refreshPosts();
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


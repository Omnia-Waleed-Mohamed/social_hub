import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/features/home/domain/entities/post_entity.dart';
import 'package:social_hub/features/home/presentation/widgets/post_card.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    required this.posts,
    required this.onRefresh,
    super.key,
  });

  final List<PostEntity> posts;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          bottom: AppSpacing.xl,
        ),
        itemCount: posts.length,
        separatorBuilder: (_, _) =>
            const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/features/users/domain/entities/user_entity.dart';
import 'package:social_hub/features/users/presentation/widgets/user_card.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    required this.users,
    required this.onRefresh,
    super.key,
  });

  final List<UserEntity> users;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          top: AppSpacing.sm,
          bottom: AppSpacing.lg,
        ),
        itemCount: users.length,
        separatorBuilder: (_, _) =>
            const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          return UserCard(user: users[index]);
        },
      ),
    );
  }
}

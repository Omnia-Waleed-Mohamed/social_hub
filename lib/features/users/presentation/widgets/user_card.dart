
import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/core/constants/users_dimensions.dart';
import 'package:social_hub/features/users/domain/entities/user_entity.dart';


class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    super.key,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final avatarLetter = user.name.trim().isNotEmpty
        ? user.name.trim()[0].toUpperCase()
        : '?';

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          UsersDimensions.cardRadius,
        ),
        side: BorderSide(
          color: colorScheme.outlineVariant,
          width: UsersDimensions.cardBorderWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: UsersDimensions.avatarSize / 2,
              backgroundColor: colorScheme.primaryContainer,
              child: Text(
                avatarLetter,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: UsersDimensions.avatarFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '@${user.username}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _UserInfoRow(
                    icon: Icons.email_outlined,
                    value: user.email,
                  ),
                  if (user.city.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    _UserInfoRow(
                      icon: Icons.location_on_outlined,
                      value: user.city,
                    ),
                  ],
                  if (user.companyName.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    _UserInfoRow(
                      icon: Icons.business_outlined,
                      value: user.companyName,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfoRow extends StatelessWidget {
  const _UserInfoRow({
    required this.icon,
    required this.value,
  });

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          icon,
          size: UsersDimensions.iconSize,
          color: colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

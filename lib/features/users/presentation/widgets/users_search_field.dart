
import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/core/constants/users_dimensions.dart';
import 'package:social_hub/generated/l10n.dart';

class UsersSearchField extends StatelessWidget {
  const UsersSearchField({
    required this.onChanged,
    super.key,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TextField(
      onChanged: onChanged,
      style: textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: S.of(context).searchUsers,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: colorScheme.onSurfaceVariant,
        ),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            UsersDimensions.searchFieldRadius,
          ),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            UsersDimensions.searchFieldRadius,
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            UsersDimensions.searchFieldRadius,
          ),
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

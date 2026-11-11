import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/generated/l10n.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onAddPressed,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomAppBar(
      color: colorScheme.surface,
      elevation: 8,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        children: [
          Expanded(
            child: _NavigationItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: S.of(context).home,
              isSelected: selectedIndex == 0,
              onTap: () => onItemSelected(0),
            ),
          ),
          Expanded(
            child: _NavigationItem(
              icon: Icons.people_outline,
              selectedIcon: Icons.people,
              label: S.of(context).users,
              isSelected: selectedIndex == 1,
              onTap: () => onItemSelected(1),
            ),
          ),
          Expanded(
            child: Center(
              child: IconButton.filled(
                onPressed: onAddPressed,
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  fixedSize: const Size(52, 52),
                ),
                icon: const Icon(Icons.add),
                tooltip: S.of(context).createPost,
              ),
            ),
          ),
          Expanded(
            child: _NavigationItem(
              icon: Icons.photo_album_outlined,
              selectedIcon: Icons.photo_album,
              label: S.of(context).albums,
              isSelected: selectedIndex == 2,
              onTap: () => onItemSelected(2),
            ),
          ),
          Expanded(
            child: _NavigationItem(
              icon: Icons.checklist_outlined,
              selectedIcon: Icons.checklist,
              label: S.of(context).todos,
              isSelected: selectedIndex == 3,
              onTap: () => onItemSelected(3),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final itemColor = isSelected
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.xs,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              color: itemColor,
              size: 22,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              label,
              style: textTheme.labelSmall?.copyWith(
                color: itemColor,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

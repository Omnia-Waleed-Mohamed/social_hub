import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_dimensions.dart';
import 'package:social_hub/core/constants/app_spacing.dart';


class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          width: AppDimensions.logoSize,
          height: AppDimensions.logoSize,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.people_alt_rounded,
            size: AppDimensions.iconLarge,
            color: colorScheme.primary,
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        Text(
          'Welcome Back!',
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppSpacing.sm),

        Text(
          'Sign in to continue to SocialHub',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
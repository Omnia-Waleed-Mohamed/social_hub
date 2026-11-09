import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_dimensions.dart';
import 'package:social_hub/generated/l10n.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const LoginButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading
            ? SizedBox(
                width: AppDimensions.iconMedium,
                height: AppDimensions.iconMedium,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Text(S.of(context).signIn),
      ),
    );
  }
}
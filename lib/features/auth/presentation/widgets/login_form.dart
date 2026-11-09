import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/features/auth/presentation/widgets/password_field.dart';
import 'package:social_hub/generated/l10n.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: usernameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: S.of(context).username,
            hintText: S.of(context).usernameHint,
            prefixIcon: const Icon(Icons.person_outline_rounded),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).usernameRequired;
            }

            return null;
          },
        ),
        const SizedBox(height: AppSpacing.lg),
        PasswordField(
          controller: passwordController,
        ),
      ],
    );
  }
}
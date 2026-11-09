import 'package:flutter/material.dart';
import 'package:social_hub/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: S.of(context).password,
        hintText: S.of(context).passwordHint,
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(
            _isObscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return S.of(context).passwordRequired;
        }

        return null;
      },
    );
  }
}
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/core/dependency_injection/service_locator.dart';
import 'package:social_hub/features/auth/domain/entities/login_failure.dart';
import 'package:social_hub/features/auth/presentation/logic/login_cubit.dart';
import 'package:social_hub/features/auth/presentation/logic/login_state.dart';
import 'package:social_hub/features/auth/presentation/widgets/login_button.dart';
import 'package:social_hub/features/auth/presentation/widgets/login_form.dart';
import 'package:social_hub/features/auth/presentation/widgets/login_header.dart';
import 'package:social_hub/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    context.read<LoginCubit>().login(
          username: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
        );
  }

  String _getFailureMessage(LoginFailure failure) {
    final localization = S.of(context);

    switch (failure) {
      case LoginFailure.invalidCredentials:
        return localization.invalidCredentials;

      case LoginFailure.noInternet:
        return 'No internet connection. Please check your Wi-Fi/mobile data and try again.';

      case LoginFailure.sslHandshake:
        return 'SSL connection problem. This usually means the network or certificate is blocking secure access.';

      case LoginFailure.timeout:
        return 'Request timed out. Please check your internet connection and try again.';

      case LoginFailure.server:
        return localization.serverError;

      case LoginFailure.unexpected:
        return localization.unexpectedError;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go('/home');
            }

            if (state is LoginFailureState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      _getFailureMessage(state.failure),
                    ),
                    backgroundColor: colorScheme.error,
                  ),
                );
            }
          },
          builder: (context, state) {
            final isLoading = state is LoginLoading;

            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: math.max(
                        0.0,
                        constraints.maxHeight - (AppSpacing.lg * 2),
                      ),
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 420,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const LoginHeader(),

                              const SizedBox(
                                height: AppSpacing.xl,
                              ),

                              LoginForm(
                                usernameController: _usernameController,
                                passwordController: _passwordController,
                              ),

                              const SizedBox(
                                height: AppSpacing.xl,
                              ),

                              LoginButton(
                                isLoading: isLoading,
                                onPressed: isLoading ? null : _login,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

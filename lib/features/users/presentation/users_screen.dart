// import 'package:flutter/material.dart';

// class UsersScreen extends StatelessWidget {
//   const UsersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Users'),
//       ),
//       body: Center(
//         child: Text('Users Screen'),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/core/constants/app_spacing.dart';
import 'package:social_hub/core/dependency_injection/service_locator.dart';
import 'package:social_hub/features/users/presentation/logic/users_cubit.dart';
import 'package:social_hub/features/users/presentation/logic/users_state.dart';
import 'package:social_hub/features/users/presentation/widgets/users_header.dart';
import 'package:social_hub/features/users/presentation/widgets/users_list.dart';
import 'package:social_hub/features/users/presentation/widgets/users_search_field.dart';
import 'package:social_hub/generated/l10n.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UsersCubit>()..loadUsers(),
      child: const _UsersView(),
    );
  }
}

class _UsersView extends StatelessWidget {
  const _UsersView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).users,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),

              const UsersHeader(),

              const SizedBox(height: AppSpacing.lg),

              UsersSearchField(
                onChanged: (query) {
                  context.read<UsersCubit>().searchUsers(query);
                },
              ),

              const SizedBox(height: AppSpacing.md),

              Expanded(
                child: BlocBuilder<UsersCubit, UsersState>(
                  builder: (context, state) {
                    if (state is UsersLoading ||
                        state is UsersInitial) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is UsersFailure) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.wifi_off,
                              size: 40,
                              color: colorScheme.error,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              S.of(context).usersLoadError,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            FilledButton(
                              onPressed: () {
                                context.read<UsersCubit>().loadUsers();
                              },
                              child: Text(S.of(context).retry),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is UsersSuccess) {
                      if (state.filteredUsers.isEmpty) {
                        return Center(
                          child: Text(
                            state.query.trim().isEmpty
                                ? S.of(context).noUsers
                                : S.of(context).noUsersFound,
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        );
                      }

                      return UsersList(
                        users: state.filteredUsers,
                        onRefresh: () {
                          return context
                              .read<UsersCubit>()
                              .refreshUsers();
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

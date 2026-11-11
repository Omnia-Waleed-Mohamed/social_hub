import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/features/users/domain/entities/user_entity.dart';
import 'package:social_hub/features/users/domain/use_cases/get_users_use_case.dart';
import 'package:social_hub/features/users/presentation/logic/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.getUsersUseCase) : super(const UsersInitial());

  final GetUsersUseCase getUsersUseCase;

  List<UserEntity> _users = [];

  Future<void> loadUsers() async {
    emit(const UsersLoading());

    try {
      _users = await getUsersUseCase();

      emit(
        UsersSuccess(
          users: _users,
          filteredUsers: _users,
        ),
      );
    } catch (_) {
      emit(const UsersFailure());
    }
  }

  Future<void> refreshUsers() async {
    try {
      _users = await getUsersUseCase();

      final currentQuery = state is UsersSuccess
          ? (state as UsersSuccess).query
          : '';

      _emitFilteredUsers(currentQuery);
    } catch (_) {
      if (state is! UsersSuccess) {
        emit(const UsersFailure());
      }
    }
  }

  void searchUsers(String query) {
    if (state is! UsersSuccess) return;

    _emitFilteredUsers(query);
  }

  void _emitFilteredUsers(String query) {
    final normalizedQuery = query.trim().toLowerCase();

    final filteredUsers = _users.where((user) {
      return user.name.toLowerCase().contains(normalizedQuery) ||
          user.username.toLowerCase().contains(normalizedQuery) ||
          user.email.toLowerCase().contains(normalizedQuery) ||
          user.city.toLowerCase().contains(normalizedQuery);
    }).toList();

    emit(
      UsersSuccess(
        users: _users,
        filteredUsers: filteredUsers,
        query: query,
      ),
    );
  }
}

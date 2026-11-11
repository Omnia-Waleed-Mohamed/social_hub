import 'package:social_hub/features/users/domain/entities/user_entity.dart';

sealed class UsersState {
  const UsersState();
}

class UsersInitial extends UsersState {
  const UsersInitial();
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersSuccess extends UsersState {
  const UsersSuccess({
    required this.users,
    required this.filteredUsers,
    this.query = '',
  });

  final List<UserEntity> users;
  final List<UserEntity> filteredUsers;
  final String query;
}

class UsersFailure extends UsersState {
  const UsersFailure();
}

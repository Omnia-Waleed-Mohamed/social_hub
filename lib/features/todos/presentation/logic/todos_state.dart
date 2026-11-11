import 'package:social_hub/features/todos/domain/entities/todo_entity.dart';

enum TodoFilter {
  all,
  active,
  completed,
}

sealed class TodosState {
  const TodosState();
}

class TodosInitial extends TodosState {
  const TodosInitial();
}

class TodosLoading extends TodosState {
  const TodosLoading();
}

class TodosSuccess extends TodosState {
  const TodosSuccess({
    required this.todos,
    required this.filter,
  });

  final List<TodoEntity> todos;
  final TodoFilter filter;

  List<TodoEntity> get filteredTodos {
    switch (filter) {
      case TodoFilter.all:
        return todos;

      case TodoFilter.active:
        return todos.where((todo) => !todo.completed).toList();

      case TodoFilter.completed:
        return todos.where((todo) => todo.completed).toList();
    }
  }

  int get completedCount =>
      todos.where((todo) => todo.completed).length;

  int get activeCount =>
      todos.where((todo) => !todo.completed).length;
}

class TodosFailure extends TodosState {
  const TodosFailure(this.message);

  final String message;
}
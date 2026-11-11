import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/features/todos/domain/entities/todo_entity.dart';
import 'package:social_hub/features/todos/domain/use_cases/get_todos_use_case.dart';
import 'package:social_hub/features/todos/presentation/logic/todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit(this.getTodosUseCase) : super(const TodosInitial());

  final GetTodosUseCase getTodosUseCase;

  List<TodoEntity> _todos = [];

  Future<void> loadTodos() async {
    emit(const TodosLoading());

    try {
      _todos = await getTodosUseCase();

      emit(TodosSuccess(todos: _todos, filter: TodoFilter.all));
    } catch (error) {
      emit(TodosFailure(error.toString()));
    }
  }

  void changeFilter(TodoFilter filter) {
    if (state is! TodosSuccess) return;

    emit(TodosSuccess(todos: _todos, filter: filter));
  }

  Future<void> toggleTodo(int todoId) async {
    if (state is! TodosSuccess) return;

    _todos = _todos.map((todo) {
      if (todo.id == todoId) {
        return todo.copyWith(completed: !todo.completed);
      }

      return todo;
    }).toList();

    final currentState = state as TodosSuccess;

    emit(TodosSuccess(todos: _todos, filter: currentState.filter));
  }

  Future<void> refreshTodos() async {
    if (state is! TodosSuccess) {
      await loadTodos();
      return;
    }

    final currentFilter = (state as TodosSuccess).filter;

    try {
      _todos = await getTodosUseCase();

      emit(TodosSuccess(todos: _todos, filter: currentFilter));
    } catch (_) {
      // Keep the currently displayed data if refreshing fails.
    }
  }
}

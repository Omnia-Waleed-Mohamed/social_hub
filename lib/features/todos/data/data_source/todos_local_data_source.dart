import 'package:hive_ce/hive.dart';
import 'package:social_hub/features/todos/data/models/todo_model.dart';

class TodosLocalDataSource {
  TodosLocalDataSource(this.box);

  final Box<dynamic> box;

  static const String _cachedTodosKey = 'cached_todos';

  Future<void> cacheTodos(List<TodoModel> todos) async {
    final todosJson = todos.map((todo) => todo.toJson()).toList();

    await box.put(_cachedTodosKey, todosJson);
  }

  List<TodoModel> getCachedTodos() {
    final cachedData = box.get(_cachedTodosKey);

    if (cachedData == null) {
      return [];
    }

    return (cachedData as List<dynamic>)
        .map(
          (todo) => TodoModel.fromJson(
            Map<String, dynamic>.from(todo as Map),
          ),
        )
        .toList();
  }
}
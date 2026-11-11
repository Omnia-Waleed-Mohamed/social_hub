import 'package:social_hub/features/todos/domain/entities/todo_entity.dart';

abstract class TodosRepository {
  Future<List<TodoEntity>> getTodos();
}
import 'package:social_hub/features/todos/domain/entities/todo_entity.dart';
import 'package:social_hub/features/todos/domain/repository/todos_repository.dart';

class GetTodosUseCase {
  const GetTodosUseCase(this.repository);

  final TodosRepository repository;

  Future<List<TodoEntity>> call() {
    return repository.getTodos();
  }
}
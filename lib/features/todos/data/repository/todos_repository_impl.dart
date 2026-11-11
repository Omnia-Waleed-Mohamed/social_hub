import 'package:social_hub/features/todos/data/data_source/todos_local_data_source.dart';
import 'package:social_hub/features/todos/data/data_source/todos_remote_data_source.dart';
import 'package:social_hub/features/todos/domain/entities/todo_entity.dart';
import 'package:social_hub/features/todos/domain/repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  TodosRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final TodosRemoteDataSource remoteDataSource;
  final TodosLocalDataSource localDataSource;

  @override
  Future<List<TodoEntity>> getTodos() async {
    try {
      final remoteTodos = await remoteDataSource.getTodos();

      await localDataSource.cacheTodos(remoteTodos);

      return remoteTodos;
    } catch (_) {
      final cachedTodos = localDataSource.getCachedTodos();

      if (cachedTodos.isNotEmpty) {
        return cachedTodos;
      }

      rethrow;
    }
  }
}
import 'package:social_hub/core/constants/api_constants.dart';
import 'package:social_hub/core/network/dio_client.dart';
import 'package:social_hub/features/todos/data/models/todo_model.dart';

class TodosRemoteDataSource {
  TodosRemoteDataSource(this.dioClient);

  final DioClient dioClient;

  Future<List<TodoModel>> getTodos() async {
    final response = await dioClient.dio.get(ApiConstants.todos);

    final data = response.data as List<dynamic>;

    return data
        .map(
          (todo) => TodoModel.fromJson(
            Map<String, dynamic>.from(todo as Map),
          ),
        )
        .toList();
  }
}
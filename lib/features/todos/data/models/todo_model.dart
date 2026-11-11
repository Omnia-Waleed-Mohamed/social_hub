import 'package:social_hub/features/todos/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  factory TodoModel.fromEntity(TodoEntity todo) {
    return TodoModel(
      id: todo.id,
      userId: todo.userId,
      title: todo.title,
      completed: todo.completed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }
}
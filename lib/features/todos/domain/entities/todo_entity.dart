class TodoEntity {
  const TodoEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  final int id;
  final int userId;
  final String title;
  final bool completed;

  TodoEntity copyWith({
    int? id,
    int? userId,
    String? title,
    bool? completed,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
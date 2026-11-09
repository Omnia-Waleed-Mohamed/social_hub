class PostEntity {
  final int id;
  final int userId;
  final String title;
  final String body;
  final String authorName;
  final String authorUsername;

  const PostEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.authorName,
    required this.authorUsername,
  });
}

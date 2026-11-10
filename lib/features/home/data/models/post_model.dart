import 'package:social_hub/features/home/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
    required super.authorName,
    required super.authorUsername,
  });

  factory PostModel.fromJson(
    Map<String, dynamic> json, {
    String authorName = '',
    String authorUsername = '',
  }) {
    return PostModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      authorName: authorName,
      authorUsername: authorUsername,
    );
  }

  factory PostModel.fromCache(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      authorName: json['authorName'] as String? ?? '',
      authorUsername: json['authorUsername'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'authorName': authorName,
      'authorUsername': authorUsername,
    };
  }
}
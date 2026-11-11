import 'package:social_hub/features/albums/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  const AlbumModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.coverImageUrl,
  });

  factory AlbumModel.fromJson(
    Map<String, dynamic> json, {
    String? coverImageUrl,
  }) {
    return AlbumModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String? ?? '',
      coverImageUrl: coverImageUrl ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'coverImageUrl': coverImageUrl,
    };
  }
}
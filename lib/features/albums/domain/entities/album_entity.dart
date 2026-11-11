class AlbumEntity {
  const AlbumEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.coverImageUrl,
  });

  final int id;
  final int userId;
  final String title;
  final String coverImageUrl;
}
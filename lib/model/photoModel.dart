class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;
  final String imageUrl;

  Photo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.imageUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      imageUrl: json['url'] ?? '',
    );
  }
}
class Song {
  final int id;
  final String title;
  final String artist;
  final String image;
  final String songLink;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.image,
    this.songLink = '',
  });
}

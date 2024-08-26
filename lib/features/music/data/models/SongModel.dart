import 'package:flutter_application_1/features/music/domain/entities/song.dart';

class SongModel extends Song {
  SongModel(
      {required int id,
      required String title,
      required String author,
      required String songLink})
      : super(id: id, title: title, author: author, songLink: songLink);

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      songLink: json['songlink'] ?? '', // 'songlink' ile eşleştirme
    );
  }
}

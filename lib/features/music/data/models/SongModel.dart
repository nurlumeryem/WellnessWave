// ignore: file_names
import 'package:flutter_application_1/features/music/domain/entities/song.dart';

class SongModel extends Song {
  SongModel(
      {required super.id,
      required super.title,
      required super.author,
      required super.songLink});

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      songLink: json['songlink'] ?? '', // 'songlink' ile eşleştirme
    );
  }
}

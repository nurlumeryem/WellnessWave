import 'package:flutter_application_1/features/music/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> getAllSongs();
}

import 'package:flutter_application_1/features/music/data/datasources/song_remote_datasource.dart';
import 'package:flutter_application_1/features/music/domain/entities/song.dart';
import 'package:flutter_application_1/features/music/domain/repository/song_repository.dart';

class SongRepositoryImpl extends SongRepository {
  final SongRemoteDataSource remoteDataSource;

  SongRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Song>> getAllSongs() async {
    final songModels = await remoteDataSource.getAllSongs();
    return songModels;
  }
}

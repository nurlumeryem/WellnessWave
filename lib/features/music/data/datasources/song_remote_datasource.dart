import 'dart:convert';

import 'package:flutter_application_1/features/music/data/models/SongModel.dart';
import 'package:http/http.dart' as http;

abstract class SongRemoteDataSource {
  Future<List<SongModel>> getAllSongs();
}

class SongRemoteDataSourceImpl implements SongRemoteDataSource {
  final http.Client client;

  SongRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SongModel>> getAllSongs() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/songs/all'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((song) => SongModel.fromJson(song)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }
}

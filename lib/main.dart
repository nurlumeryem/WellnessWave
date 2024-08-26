import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/music/data/datasources/song_remote_datasource.dart';
import 'package:flutter_application_1/features/music/data/repository/song_repository_impl.dart';
import 'package:flutter_application_1/features/music/domain/usecases/get_all_songs.dart';
import 'package:flutter_application_1/features/music/presentation/bloc/song_bloc.dart';
import 'package:flutter_application_1/features/music/presentation/bloc/song_event.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:flutter_application_1/presentation/homePage/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigationBloc()),
          BlocProvider(
              create: (context) => SongBloc(
                  getAllSongs: GetAllSongs(
                      repository: SongRepositoryImpl(
                          remoteDataSource:
                              SongRemoteDataSourceImpl(client: http.Client()))))
                ..add(FetchSongs()))
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
              useMaterial3: true,
            ),
            home: HomeScreen()));
  }
}

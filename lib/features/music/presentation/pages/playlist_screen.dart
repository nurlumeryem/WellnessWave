import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme.dart';
import 'package:flutter_application_1/features/music/presentation/bloc/song_bloc.dart';
import 'package:flutter_application_1/features/music/presentation/bloc/song_state.dart';
import 'package:flutter_application_1/features/music/presentation/pages/music_player_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});
  final List<Map<String, String>> songs = [
    {
      'title': 'Rain On Glass',
      'artist': 'Rain On Glass',
      'image': 'assets/rain.jpeg',
      // 'songLink': 'assets/nightfall.mp3',
    },
    {
      'title': 'Winter Nights',
      'artist': 'Soothing Sounds',
      'image': 'assets/winter.jpeg',
      //'songLink': 'assets/flow.mp3'
    },
    {
      'title': 'Sunset Boulevard',
      'artist': 'Golden Melodies',
      'image': 'assets/sunset.jpeg',
      //'songLink': 'assets/midnight.mp3',
    },
    {
      'title': 'Summer Breeze',
      'artist': 'Cool Vibes',
      'image': 'assets/summer.jpeg',
      //'songLink': 'assets/place.mp3',
    },
    {
      'title': 'Autumn Leaves',
      'artist': 'Chill Music',
      'image': 'assets/autumn.jpeg',
      //'songLink': 'assets/summer.mp3',
    },
    {
      'title': 'Spring Awakening',
      'artist': 'Melody Makers',
      'image': 'assets/spring.jpeg',
      // 'songLink': 'assets/epic.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chill Plalist',
          style: TextStyle(fontSize: FontSizes.large),
        ),
        backgroundColor: DefaultColors.white,
        elevation: 1,
        centerTitle: false,
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SongLoaded) {
            return Container(
              color: DefaultColors.white,
              child: ListView.builder(
                  itemCount: state.songs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(songs[index]['image']!),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 30),
                      title: Text(
                        state.songs[index].title,
                        style: const TextStyle(fontSize: FontSizes.large),
                      ),
                      subtitle: Text(
                        state.songs[index].artist,
                        style: const TextStyle(fontSize: FontSizes.standard),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MusicPlayerScreen(
                                    song: state.songs[index],
                                  )),
                        );
                      },
                    );
                  }),
            );
          } else if (state is SongError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          } else {
            return Center(
              child: Text(
                'No songs found',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        },
      ),
    );
  }
}

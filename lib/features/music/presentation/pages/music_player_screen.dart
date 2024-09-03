import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme.dart';
import 'package:flutter_application_1/features/music/domain/entities/song.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Song song;
  MusicPlayerScreen({Key? key, required this.song}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isLooping = false;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _loadAudio();
    super.initState();
  }

  Future<void> _loadAudio() async {
    try {
      if (widget.song.songLink.startsWith('assets/')) {
        await _audioPlayer
            .setAudioSource(AudioSource.asset(widget.song.songLink));
      } else {
        await _audioPlayer
            .setAudioSource(AudioSource.uri(Uri.parse(widget.song.songLink)));
      }
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void seekBackward() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - Duration(seconds: 10);
    _audioPlayer
        .seek(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  void seekForward() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition + Duration(seconds: 10);
    _audioPlayer.seek(newPosition);
  }

  void seekRestart() {
    _audioPlayer.seek(Duration.zero);
  }

  void toggleLoop() {
    setState(() {
      isLooping = !isLooping;
      _audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              child: Image.asset('assets/down_arrow.png'),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.song.image,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.song.title,
                style: const TextStyle(fontSize: FontSizes.extraLarge),
              ),
              Text(
                'By : ${widget.song.artist}',
                style: const TextStyle(fontSize: FontSizes.large),
              ),
              const Spacer(),
              StreamBuilder<Duration>(
                  stream: _audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    final total = _audioPlayer.duration ?? Duration.zero;
                    return ProgressBar(
                      progress: position,
                      total: total,
                      baseBarColor: DefaultColors.lightpink,
                      thumbColor: DefaultColors.pink,
                      progressBarColor: DefaultColors.pink,
                      onSeek: (duraction) {
                        _audioPlayer.seek(duraction);
                      },
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shuffle,
                        color: DefaultColors.pink,
                      )),
                  IconButton(
                      onPressed: seekBackward,
                      icon: const Icon(
                        Icons.skip_previous,
                        color: DefaultColors.pink,
                      )),
                  StreamBuilder(
                      stream: _audioPlayer.playerStateStream,
                      builder: (context, snapshot) {
                        final playerState = snapshot.data;
                        final processingState = playerState?.processingState ??
                            ProcessingState.idle;
                        final playing = playerState?.playing ?? false;

                        if (processingState == ProcessingState.loading ||
                            processingState == ProcessingState.buffering) {
                          return Container(
                            margin: EdgeInsets.all(8),
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              color: DefaultColors.pink,
                            ),
                          );
                        } else if (!playing) {
                          return IconButton(
                              iconSize: 80,
                              onPressed: togglePlayPause,
                              icon: Icon(
                                Icons.play_circle_filled,
                                color: DefaultColors.pink,
                              ));
                        } else if (processingState !=
                            ProcessingState.completed) {
                          return IconButton(
                              iconSize: 80,
                              onPressed: togglePlayPause,
                              icon: Icon(
                                Icons.pause_circle_filled,
                                color: DefaultColors.pink,
                              ));
                        } else {
                          return IconButton(
                              iconSize: 80,
                              onPressed: seekRestart,
                              icon: Icon(
                                Icons.replay_circle_filled,
                                color: DefaultColors.pink,
                              ));
                        }
                      }),
                  IconButton(
                      onPressed: seekForward,
                      icon: const Icon(
                        Icons.skip_next,
                        color: DefaultColors.pink,
                      )),
                  IconButton(
                      onPressed: toggleLoop,
                      icon: Icon(
                        isLooping ? Icons.repeat_on : Icons.repeat,
                        color: DefaultColors.pink,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

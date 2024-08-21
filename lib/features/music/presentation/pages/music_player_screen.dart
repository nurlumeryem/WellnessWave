import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme.dart';
import 'package:flutter_application_1/features/music/domain/entities/song.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Song song;
  const MusicPlayerScreen({required this.song});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Image.asset('assets/down_arrow.png'),
          actions: [
            Image.asset('assets/transcript_icon.png'),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/huzur.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text('Her anın huzuru içindeki sessizlikte gizlidir',
                  style: Theme.of(context).textTheme.labelLarge),
              Spacer(),
              ProgressBar(
                  progress: Duration(seconds: 1000),
                  total: Duration(seconds: 1000)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shuffle,
                        color: DefaultColors.pink,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous,
                        color: DefaultColors.pink,
                      )),
                  IconButton(
                      iconSize: 80,
                      onPressed: () {},
                      icon: Icon(
                        Icons.pause_circle_filled,
                        color: DefaultColors.pink,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next,
                        color: DefaultColors.pink,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.repeat,
                        color: DefaultColors.pink,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

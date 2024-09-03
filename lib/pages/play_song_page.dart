import 'package:audio_player/components/play_song_header.dart';
import 'package:audio_player/components/song_control_sound.dart';
import 'package:audio_player/components/song_controller_buttons.dart';
import 'package:audio_player/components/song_details.dart';
import 'package:audio_player/components/song_wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              PlaySongHeader(),
              SizedBox(
                height: 10,
              ),
              SongControlSound(),
              SizedBox(
                height: 40,
              ),
              SongDetails(),
              Spacer(),
              SongControllerButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:audio_player/components/play_song_header.dart';
import 'package:audio_player/components/song_control_sound.dart';
import 'package:audio_player/components/song_controller_buttons.dart';
import 'package:audio_player/components/song_details.dart';
import 'package:flutter/material.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const PlaySongHeader(),
              const SizedBox(
                height: 10,
              ),
              SongControlSound(),
              const SizedBox(
                height: 40,
              ),
              SongDetails(),
              Spacer(),
              const SongControllerButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

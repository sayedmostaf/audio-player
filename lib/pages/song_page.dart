import 'package:audio_player/components/Trending_song_slider.dart';
import 'package:audio_player/components/song_header.dart';
import 'package:audio_player/components/song_tile.dart';
import 'package:audio_player/config/colors.dart';
import 'package:audio_player/controller/song_data_controller.dart';
import 'package:audio_player/controller/song_player_controller.dart';
import 'package:audio_player/pages/play_song_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SongPageHeader(),
                const SizedBox(
                  height: 20,
                ),
                const TrendingSongSlider(),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          songDataController.isDeviceSong.value = false;
                        },
                        child: Text(
                          'Cloud Song',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: songDataController.isDeviceSong.value
                                        ? lableColor
                                        : primaryColor,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          songDataController.isDeviceSong.value = true;
                        },
                        child: Text(
                          'Device Song',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: songDataController.isDeviceSong.value
                                        ? primaryColor
                                        : lableColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => !songDataController.isDeviceSong.value
                      ? const Column(
                          children: [
                            // const SongTile(),
                            // const SongTile(),
                            // const SongTile(),
                            // const SongTile(),
                          ],
                        )
                      : Column(
                          children: songDataController.localSongList.value
                              .map(
                                (e) => SongTile(
                                  songName: e.title,
                                  onPressed: () {
                                    songPlayerController.playLocalAudio(e.data);
                                    Get.to(const PlaySongPage());
                                  },
                                ),
                              )
                              .toList(),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

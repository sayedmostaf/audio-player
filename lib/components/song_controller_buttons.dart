import 'package:audio_player/config/colors.dart';
import 'package:audio_player/controller/song_data_controller.dart';
import 'package:audio_player/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SongControllerButtons extends StatelessWidget {
  const SongControllerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${songPlayerController.currentTime}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Obx(
                  () => Slider(
                    value: songPlayerController.sliderValue.value
                        .clamp(0.0, songPlayerController.sliderValue.value),
                    onChanged: (value) {
                      songPlayerController.sliderValue.value = value;
                      Duration songPosition = Duration(seconds: value.toInt());
                      songPlayerController.changeSongSlider(songPosition);
                    },
                    min: 0,
                    max: songPlayerController.sliderMaxValue.value,
                  ),
                ),
              ),
              Text(
                '${songPlayerController.totalTime}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                songDataController.playPreviousSong();
              },
              child: SvgPicture.asset(
                'assets/icons/play_back.svg',
                width: 25,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Obx(
              () => !songPlayerController.isPlaying.value
                  ? InkWell(
                      onTap: () {
                        songPlayerController.resumePlaying();
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/play.svg',
                            width: 25,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        songPlayerController.pausePlaying();
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/pause.svg',
                            width: 25,
                          ),
                        ),
                      ),
                    ),
            ),
            const SizedBox(
              width: 40,
            ),
            InkWell(
              onTap: () {
                songDataController.playNextSong();
              },
              child: SvgPicture.asset(
                'assets/icons/play_forward.svg',
                width: 25,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/icons/shuffle.svg',
              width: 20,
            ),
            InkWell(
              onTap: () {
                songPlayerController.setLoopSong();
              },
              child: Obx(
                () => SvgPicture.asset(
                  'assets/icons/repeat.svg',
                  width: 20,
                  color: songPlayerController.isLoop.value
                      ? primaryColor
                      : lableColor,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/fav.svg',
              width: 20,
            ),
            SvgPicture.asset(
              'assets/icons/heart.svg',
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}

import 'package:audio_player/controller/song_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/play_outline.svg'),
            const SizedBox(
              width: 10,
            ),
            Text(
              '210 Plays',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Obx(
                () => Text(
                  songPlayerController.songTitle.value,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/download.svg',
              width: 25,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Row(
            children: [
              Text(
                songPlayerController.songArtist.value,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ],
    );
  }
}

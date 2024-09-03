import 'package:audio_player/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongControllerButtons extends StatelessWidget {
  const SongControllerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('02:34'),
            const Text('/'),
            Text(
              '2.34',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/play_back.svg',
              width: 25,
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
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
            const SizedBox(
              width: 40,
            ),
            SvgPicture.asset(
              'assets/icons/play_forward.svg',
              width: 25,
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
            SvgPicture.asset(
              'assets/icons/repeat.svg',
              width: 20,
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

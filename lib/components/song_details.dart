import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SongDetails extends StatelessWidget {
  const SongDetails(
      {super.key, required this.songTitle, required this.artistName});
  final String songTitle, artistName;

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                songTitle,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
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
        Row(
          children: [
            Text(
              artistName,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ],
    );
  }
}

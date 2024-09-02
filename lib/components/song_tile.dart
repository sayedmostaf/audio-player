import 'package:audio_player/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongTile extends StatelessWidget {
  const SongTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          color: divColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(13)),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/play.svg'),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Chalo bulawa aya hai mata',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

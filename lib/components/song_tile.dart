import 'package:audio_player/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongTile extends StatelessWidget {
  const SongTile({super.key, required this.songName, required this.onPressed});
  final String songName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
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
              Flexible(
                child: Text(
                  songName,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

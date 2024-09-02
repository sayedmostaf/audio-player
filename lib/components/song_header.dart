import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongPageHeader extends StatelessWidget {
  const SongPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/small_logo.svg',
          width: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'MUSIC BAG',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xff969696),
          ),
        ),
      ],
    );
  }
}

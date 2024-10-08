import 'package:audio_player/config/themes.dart';
import 'package:audio_player/pages/play_song_page.dart';
import 'package:audio_player/pages/song_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio Player',
      theme: darkTheme,
      home: const SongPage(),
    );
  }
}

import 'package:audio_player/config/themes.dart';
import 'package:audio_player/pages/song_page.dart';
import 'package:audio_player/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: darkTheme,
      home: const SongPage(),
    );
  }
}

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  RxBool isLoop = false.obs;
  RxBool isSuffled = false.obs;
  RxDouble volumeLevel = 0.2.obs;

  void playLocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist!;

    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(song.data),
      ),
    );
    player.play();
    updatePosition();
    isPlaying.value = true;
  }

  void setLoopSong() async {
    if (isLoop.value) {
      await player.setLoopMode(LoopMode.off);
    } else {
      await player.setLoopMode(LoopMode.one);
    }
    isLoop.value = !isLoop.value;
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  void changeSongSlider(Duration position) {
    player.seek(position);
  }

  void playRandomSong() async {
    if (isSuffled.value) {
      await player.setShuffleModeEnabled(false);
    } else {
      await player.setShuffleModeEnabled(true);
    }
    isSuffled.value = !isSuffled.value;
  }

  void changeVolume(double volume) {
    volumeLevel.value = volume;
    player.setVolume(volumeLevel.value);
  }

  void pausePlaying() async {
    await player.stop();
    isPlaying.value = false;
  }

  void updatePosition() async {
    try {
      player.durationStream.listen((d) {
        totalTime.value = d.toString().split('.')[0];
        sliderMaxValue.value = d!.inSeconds.toDouble();
        player.positionStream.listen((p) {
          currentTime.value = p.toString().split('.')[0];
          sliderValue.value = p.inSeconds.toDouble();
        });
      });
    } catch (e) {
      print(e);
    }
  }
}

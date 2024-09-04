import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;

  void playLocalAudio(String url) async {
    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(url),
      ),
    );
    player.play();
    updatePosition();
    isPlaying.value = true;
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  void pausePlaying() async {
    await player.stop();
    isPlaying.value = false;
  }

  void updatePosition() async {
    try {
      player.durationStream.listen((d) {
        totalTime.value = d.toString().split('.')[0];
        player.positionStream.listen((p) {
          currentTime.value = p.toString().split('.')[0];
        });
      });
    } catch (e) {
      print(e);
    }
  }
}

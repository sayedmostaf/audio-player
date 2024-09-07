import 'package:audio_player/controller/song_player_controller.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongDataController extends GetxController {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  final audioQuery = OnAudioQuery();

  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPlayingIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    storagePermission();
  }

  void getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
  }

  void storagePermission() async {
    try {
      var perm = await Permission.storage.request();
      if (perm.isGranted) {
        getLocalSongs();
      } else {
        await Permission.storage.request();
      }
    } catch (e) {
      print(e);
    }
  }

  void findCurrentSongPlayingIndex(int songId) {
    var index = 0;
    localSongList.forEach((e) {
      if (e.id == songId) {
        currentSongPlayingIndex.value = index;
      }
      index++;
    });
  }

  void playNextSong() {
    int songListLength = localSongList.length;
    currentSongPlayingIndex.value = currentSongPlayingIndex.value + 1;
    if (currentSongPlayingIndex.value < songListLength) {
      SongModel nextSong = localSongList[currentSongPlayingIndex.value];
      songPlayerController.playLocalAudio(nextSong);
    }
  }

  void playPreviousSong() {
    int songListLength = localSongList.length;
    if (currentSongPlayingIndex.value != 0) {
      currentSongPlayingIndex.value = --currentSongPlayingIndex.value;
      if (currentSongPlayingIndex.value < songListLength) {
        SongModel prevSong = localSongList[currentSongPlayingIndex.value];
        songPlayerController.playLocalAudio(prevSong);
      }
    }
  }

  // Future<void> getDeviceSongs() async {
  //   try {
  //     // Check and request permissions
  //     var status = await Permission.storage.request();

  //     // On Android 13+ request media permissions as well
  //     if (await Permission.mediaLibrary.isDenied) {
  //       await Permission.mediaLibrary.request();
  //     }

  //     if (status.isGranted) {
  //       deviceSongList.value = await audioQuery.querySongs(
  //         ignoreCase: true,
  //         orderType: OrderType.ASC_OR_SMALLER,
  //         sortType: null,
  //         uriType: UriType.EXTERNAL,
  //       );
  //       print(deviceSongList.value);
  //     } else {
  //       print('Permission denied');
  //     }
  //   } catch (e) {
  //     print("Error fetching local songs: $e");
  //   }
  // }
}

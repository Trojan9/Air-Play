import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  var duration = Duration(seconds: 0, minutes: 0).obs;
  var position = Duration().obs;
  AudioPlayer audioPlayer = AudioPlayer();
  playUrl(var url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
    }
  }

  var play = true.obs;
  playLocal(var localPath) async {
    int result = await audioPlayer.play(localPath, isLocal: true);
    print(result);
  }

  String checktime(Duration time) {
    int min = (time.inSeconds / 60).toInt();
    int seconds = (time.inSeconds % 60).toInt();
    int hour = (time.inSeconds / 3600).toInt();
    if (hour > 0) {
      return "$hour:$min:$seconds";
    } else if (min > 0) {
      return "$min:$seconds";
    } else {
      return "$min:$seconds";
    }
  }
  // var _songs = [].obs;

}

import 'dart:io';

import 'package:Airplay/utils/theme/config.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AppController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    getmp3();
    currentTheme.addListener(() {
      // setState(() {});
    });
  }

  var files = <FileSystemEntity>[].obs;
  Directory dir = Directory('/storage/emulated/0');
  var songs = <FileSystemEntity>[].obs;
  var isnowplaying = false.obs;
  var nowplayingpath = ''.obs;
  var nowplayingmeta = {}.obs;

  void setNowplayingData({var path, var play, var meta}) {
    nowplayingpath.value = path;
    isnowplaying.value = play;
    nowplayingmeta.value = meta;
  }

  void getmp3() async {
    if (await Permission.storage.request().isGranted) {
      String mp3Path = dir.toString();
      print(mp3Path);
      files.value = dir.listSync(recursive: true, followLinks: false);
      for (FileSystemEntity entity in files) {
        String path = entity.path;
        if (path.endsWith('.mp3')) songs.add(entity);
      }
      print('my songs');
      print(songs);
      // print(songs.length);
    }
  }
}

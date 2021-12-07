import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Controller extends GetxController {
  var count = 0.obs;

  // var _songs = [].obs;
  List<FileSystemEntity> files = <FileSystemEntity>[].obs;
  Directory dir = Directory('/storage/emulated/0');
  List<FileSystemEntity> songs = <FileSystemEntity>[].obs;
  void getmp3() async {
    if (await Permission.storage.request().isGranted) {
      String mp3Path = dir.toString();
      print(mp3Path);
      files = dir.listSync(recursive: true, followLinks: false);
      for (FileSystemEntity entity in files) {
        String path = entity.path;
        if (path.endsWith('.mp3')) songs.add(entity);
      }
      print(songs);
      print(songs.length);
    }
  }
}

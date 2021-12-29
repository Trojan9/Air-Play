import 'package:Airplay/core/controllers/appctrl.dart';
import 'package:Airplay/core/controllers/nowplayingmp3ctrl.dart';
import 'package:Airplay/ui/now_playing/now_playing.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:id3/id3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongsLV extends StatefulWidget {
  const SongsLV({Key? key}) : super(key: key);

  @override
  _SongsLVState createState() => _SongsLVState();
}

class _SongsLVState extends State<SongsLV> {
  List<int> fav = [];
  final AppController c = Get.find();
  // Directory dir = Directory('/storage/emulated/0');

  // List<FileSystemEntity> _files = [];
  // List<FileSystemEntity> _songs = [];
  void initlist() async {
    // var status = await Permission.storage.status;
    //               if (!status.isGranted) {
    //                 await Permission.storage.request();
    //               }
    // if (await Permission.storage.request().isGranted) {
    //   String mp3Path = dir.toString();
    //   print(mp3Path);
    //   _files = dir.listSync(recursive: true, followLinks: false);
    //   for (FileSystemEntity entity in _files) {
    //     String path = entity.path;
    //     if (path.endsWith('.mp3')) _songs.add(entity);
    //   }
    //   print(_songs);
    //   print(_songs.length);
    //   setState(() {});
    // }
  }

  @override
  void initState() {
    super.initState();
    initlist();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => RxBool(c.songs.isEmpty).isTrue
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: c.songs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      List<int> mp3Bytes =
                          File(c.songs[index].path).readAsBytesSync();
                      MP3Instance mp3instance = new MP3Instance(mp3Bytes);
                      var meta;
                      if (!(c.songs[index].path).contains("WhatsApp")) {
                        if (mp3instance.parseTagsSync()) {
                          meta = mp3instance.getMetaTags();
                          print(meta);
                        }
                      }
                      var filename = c.songs[index].path
                          .substring(c.songs[index].path.lastIndexOf('/') + 1);
                      return Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: wholescreenWidth(context),
                        // height: MediaQuery.of(context).size.height / 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 8, bottom: 10),
                              child: InkWell(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            size: 14,
                                            color: backgroundcolor1,
                                            fontWeight: FontWeight.w400,
                                            text: meta != null
                                                ? meta["Title"] != null
                                                    ? meta["Title"]
                                                    : filename
                                                : filename,
                                          ),
                                          verticalSpaceSmall,
                                          CustomText(
                                            size: 14,
                                            color: regular,
                                            fontWeight: FontWeight.w400,
                                            text: meta != null
                                                ? meta["Artist"] != null
                                                    ? meta["Artist"]
                                                    : ""
                                                : "",
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        width: wholescreenWidth(context) / 2.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            fav.contains(index)
                                                ? IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        fav.remove(index);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      size: 25,
                                                      color: regular,
                                                    ))
                                                : IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        fav.add(index);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.favorite_outline,
                                                      size: 25,
                                                      color: regular,
                                                    )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.cloud_download,
                                                  size: 25,
                                                  color: regular,
                                                )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.more_vert,
                                                  size: 25,
                                                  color: regular,
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  c.setNowplayingData(
                                      path: c.songs[index].path, meta: meta);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NowPlaying(
                                        file: File(c.songs[index].path),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: 2,
                              color: regular,
                              width: wholescreenWidth(context),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 7,
              )
            ],
          ));
  }
}

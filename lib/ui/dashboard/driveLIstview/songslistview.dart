import 'package:Airplay/core/controllers/appctrl.dart';
import 'package:Airplay/core/controllers/nowplayingmp3ctrl.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:id3/id3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongsDriveLV extends StatefulWidget {
  const SongsDriveLV({Key? key}) : super(key: key);

  @override
  _SongsDriveLVState createState() => _SongsDriveLVState();
}

class _SongsDriveLVState extends State<SongsDriveLV> {
  List<int> fav = [];
  final AppController c = Get.find();
  void initlist() async {
    // var status = await Permission.storage.status;
    //               if (!status.isGranted) {
    //                 await Permission.storage.request();
    //               }
    // if (await Permission.storage.request().isGranted) {
    //   String mp3Path = c.dir.toString();
    //   print(mp3Path);

    //  c.files = c.dir.listSync(recursive: true, followLinks: false);
    //   for (FileSystemEntity entity in c.files) {
    //     String path = entity.path;
    //     if (path.endsWith('.mp3')) c.songs.add(entity);
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
    return Obx(() => Column(
          children: [
            RxBool(c.files.isEmpty).isTrue
                ? Padding(
                    padding: const EdgeInsets.only(top: 58.0),
                    child: Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 50,
                    )),
                  )
                : Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              List<int> mp3Bytes =
                                  File(c.songs[index].path).readAsBytesSync();
                              MP3Instance mp3instance =
                                  new MP3Instance(mp3Bytes);
                              var meta;
                              if (!(c.songs[index].path).contains("WhatsApp")) {
                                if (mp3instance.parseTagsSync()) {
                                  meta = mp3instance.getMetaTags();
                                  print(meta);
                                }
                              }
                              var filename = c.songs[index].path.substring(
                                  c.songs[index].path.lastIndexOf('/') + 1);
                              return Container(
                                color: backgroundcolor2,
                                width: wholescreenWidth(context),
                                // height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 8, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
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
                                              width: wholescreenWidth(context) /
                                                  2.5,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                            Icons
                                                                .favorite_outline,
                                                            size: 25,
                                                            color: regular,
                                                          )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.cloud_upload,
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
                  ),
          ],
        ));
  }
}

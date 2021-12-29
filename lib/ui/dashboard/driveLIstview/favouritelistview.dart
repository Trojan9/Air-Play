// @dart=2.9

import 'dart:io';
import 'package:Airplay/core/controllers/appctrl.dart';
import 'package:Airplay/core/controllers/nowplayingmp3ctrl.dart';
import 'package:get/get.dart';
import 'package:id3/id3.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

/// create a FlutterAudioQuery instance.

// ignore: import_of_legacy_library_into_null_safe

class FavouriteDriveLV extends StatefulWidget {
  const FavouriteDriveLV({Key key}) : super(key: key);

  @override
  _FavouriteDriveLVState createState() => _FavouriteDriveLVState();
}

class _FavouriteDriveLVState extends State<FavouriteDriveLV> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  // returns all artists available
  List<ArtistInfo> artists;
  final AppController c = Get.find();

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    // artists = await audioQuery.getArtists();
    // print(artists.length);
    // artists.forEach((artist) {
    //   print(artist);

    //   /// prints all artist property values
    // });
    // Directory dir = Directory('/storage/emulated/0/Downloads');
    // var files = await dirContents(dir);
    // print(files);
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    initlist();
  }

  var files = <FileSystemEntity>[];
  // Future<List<FileSystemEntity>> dirContents(Directory dir) {
  //   var completer = Completer<List<FileSystemEntity>>();
  //   var lister = dir.list(recursive: false);

  //   lister.listen((file) async {
  //     FileStat f = file.statSync();
  //     if (f.type == FileSystemEntityType.directory) {
  //       await dirContents(Directory(file.uri.toFilePath()));
  //     } else if (f.type == FileSystemEntityType.file &&
  //         file.path.endsWith('.Mp3')) {
  //       _files.add(file);
  //     }
  //   }, onDone: () {
  //     completer.complete(files);
  //     setState(() {
  //       //
  //     });
  //   });

  //   return completer.future;
  // }

  void initlist() async {}

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            RxBool(c.songs.isEmpty).value
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: c.songs.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: wholescreenWidth(context),
                                //height: MediaQuery.of(context).size.height / 10,
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
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: CustomText(
                                                      size: 14,
                                                      color: backgroundcolor1,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      text: meta != null
                                                          ? meta["Title"] !=
                                                                  null
                                                              ? meta["Title"]
                                                              : filename
                                                          : filename),
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
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.favorite,
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

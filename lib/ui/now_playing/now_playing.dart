import 'dart:convert';
import 'dart:io';
import 'dart:io';
import 'package:Airplay/core/controllers/appctrl.dart';
import 'package:Airplay/core/controllers/nowplayingmp3ctrl.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:id3/id3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final AppController c = Get.find();

class NowPlaying extends StatefulWidget {
  late File file;
  NowPlaying({Key? key, required this.file}) : super(key: key);

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  // AudioPlayer audioPlayer = AudioPlayer();
  final Controller c = Get.put(Controller());
  double _value = 1.0;
  var meta;
  var filename;
  TextEditingController controller = new TextEditingController();
  TextEditingController metasController = new TextEditingController();
  double bufferingProgress = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    List<int> mp3Bytes = File(widget.file.path).readAsBytesSync();
    MP3Instance mp3instance = new MP3Instance(mp3Bytes);

    if (mp3instance.parseTagsSync()) {
      meta = mp3instance.getMetaTags();
      print(meta);
    }
    filename =
        widget.file.path.substring(widget.file.path.lastIndexOf('/') + 1);
    // c.setNowplayingData(
    //   path:
    // )

    super.initState();

    c.playLocal(widget.file.path);
    c.audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      c.duration.value = d;
    });
    c.audioPlayer.onAudioPositionChanged.listen(
        (Duration p) => {print('Current position: $p'), c.position.value = p});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // audioPlayer.dispose();
    super.dispose();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = screenHeightSize(context);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: backgroundcolor2,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: heightSize * 0.020),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SongRowTitle(),
                SizedBox(height: heightSize * 0.010),
                Container(
                  // color: Colors.teal,
                  height: heightSize * 0.470,
                  width: double.infinity,
                  child: meta != null
                      ? meta["APIC"] == null
                          ? Image.asset(
                              "assets/4.png",
                              fit: BoxFit.contain,
                            )
                          : meta["APIC"]["base64"] != null
                              ? Image.memory(
                                  base64Decode(meta["APIC"]["base64"]))
                              : Image.asset(
                                  "assets/4.png",
                                  fit: BoxFit.contain,
                                )
                      : Image.asset(
                          "assets/4.png",
                          fit: BoxFit.contain,
                        ),
                ),
                SizedBox(height: heightSize * 0.010),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      meta != null
                          ? meta["Title"] != null
                              ? meta["Title"]
                              : filename
                          : filename,
                      style: TextStyle(
                        fontSize: heightSize * 0.025,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: heightSize * 0.005),
                    Text(
                      meta != null
                          ? meta["Artist"] != null
                              ? meta["Artist"]
                              : ""
                          : "",
                      style: TextStyle(
                        fontSize: heightSize * 0.023,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: heightSize * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: heightSize * 0.045,
                      ),
                      color: regular, // Colors.white,
                      onPressed: () async {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.playlist_play,
                        size: heightSize * 0.045,
                      ),
                      color: regular, // Colors.white,
                      onPressed: () async {},
                    ),
                  ],
                ),
                SizedBox(height: heightSize * 0.005),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Slider(
                            //   value: _value,
                            //   min: 0.0,
                            //   max: 100.0,
                            //   label: '$_value',
                            //   activeColor: regular,
                            //   inactiveColor: Colors.white,
                            //   onChanged: (newValue) {
                            //     setState(() {
                            //       _value = newValue;
                            //     });
                            //   },
                            // ),
                            min: 0,
                            max: c.duration.value.inMilliseconds.toDouble(),
                            label:
                                "${c.position.value.inMilliseconds.toDouble()}",
                            activeColor: regular,
                            inactiveColor: Colors.white,
                            value: c.position.value.inMilliseconds.toDouble(),
                            onChanged: (position) async {
                              int result = await c.audioPlayer.seek(
                                  Duration(milliseconds: position.toInt()));
                              print(result);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${c.checktime(c.position.value)}",
                                style: TextStyle(
                                  fontSize: heightSize * 0.020,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${c.checktime(c.duration.value)}',
                                style: TextStyle(
                                  fontSize: heightSize * 0.020,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize * 0.040),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.shuffle,
                                size: heightSize * 0.042,
                              ),
                              color: regular, // Colors.white,
                              onPressed: () {},
                            ),
                            Container(
                              height: heightSize * 0.069,
                              width: heightSize * 0.069,
                              decoration: BoxDecoration(
                                color: regular,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Container(
                                  height: heightSize * 0.064,
                                  width: heightSize * 0.064,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor2,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.fast_rewind_sharp,
                                        size: heightSize * 0.042,
                                      ),
                                      color: regular, // Colors.white,
                                      onPressed: () async {
                                        int result = await c.audioPlayer.seek(
                                            Duration(
                                                milliseconds: c.position.value
                                                        .inMilliseconds -
                                                    1200));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: heightSize * 0.069,
                              width: heightSize * 0.069,
                              decoration: BoxDecoration(
                                color: regular,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Container(
                                  height: heightSize * 0.064,
                                  width: heightSize * 0.064,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor2,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        c.play.value
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: heightSize * 0.042,
                                      ),
                                      color: regular, // Colors.white,
                                      onPressed: () async {
                                        if (c.play.value) {
                                          int result =
                                              await c.audioPlayer.pause();

                                          c.play.value = false;
                                        } else {
                                          int result =
                                              await c.audioPlayer.resume();

                                          c.play.value = true;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: heightSize * 0.069,
                              width: heightSize * 0.069,
                              decoration: BoxDecoration(
                                color: regular,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Container(
                                  height: heightSize * 0.064,
                                  width: heightSize * 0.064,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor2,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.fast_forward_sharp,
                                        size: heightSize * 0.042,
                                      ),
                                      color: regular, // Colors.white,
                                      onPressed: () async {
                                        int result = await c.audioPlayer.seek(
                                            Duration(
                                                milliseconds: c.position.value
                                                        .inMilliseconds +
                                                    1200));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.repeat_rounded,
                                size: heightSize * 0.042,
                              ),
                              color: regular, // Colors.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SongRowTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightSize = screenHeightSize(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: heightSize * 0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: heightSize * 0.042,
              ),
              color: regular, // Colors.white,

              onPressed: () {
                Navigator.pop(context);
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Playing From Songs',
                style: TextStyle(
                  fontSize: heightSize * 0.025,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: heightSize * 0.005),
              Text(
                'Mayorkun',
                style: TextStyle(
                  fontSize: heightSize * 0.023,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: heightSize * 0.042,
            ),
            color: regular, // Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

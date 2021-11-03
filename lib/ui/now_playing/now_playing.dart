import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  double _value = 1.0;

  @override
  Widget build(BuildContext context) {
    double heightSize = screenHeightSize(context);
    return Scaffold(
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
                child: Image.asset(
                  "assets/song.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: heightSize * 0.010),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Holy Father',
                    style: TextStyle(
                      fontSize: heightSize * 0.025,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: heightSize * 0.005),
                  Text(
                    'Mayorkun & Victony',
                    style: TextStyle(
                      fontSize: heightSize * 0.025,
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
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.playlist_play,
                      size: heightSize * 0.045,
                    ),
                    color: regular, // Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Slider(
                      value: _value,
                      min: 0.0,
                      max: 100.0,
                      label: '$_value',
                      activeColor: regular,
                      inactiveColor: Colors.white,
                      onChanged: (newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1:12',
                          style: TextStyle(
                            fontSize: heightSize * 0.020,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '3:02',
                          style: TextStyle(
                            fontSize: heightSize * 0.020,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize * 0.035),
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
                                  Icons.fast_forward_sharp,
                                  size: heightSize * 0.042,
                                ),
                                color: regular, // Colors.white,
                                onPressed: () {},
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
                                  Icons.play_arrow,
                                  size: heightSize * 0.042,
                                ),
                                color: regular, // Colors.white,
                                onPressed: () {},
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
                                onPressed: () {},
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
              )
            ],
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

            onPressed: () => Navigator.pop(context),
          ),
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

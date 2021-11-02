import 'dart:async';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  Color backgr = Colors.white;
  bool change = false;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        backgr = backgroundcolor2;
        change = true;
        //linearGradient = Colors.white.createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
      });
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const Onboarding())));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Shader linearGradient = const LinearGradient(
      // begin: Alignment.bottomLeft,
      // end: Alignment.topRight,
      // stops: [0.1, 0.5, 0.75],
      colors: <Color>[
        Color.fromRGBO(229, 229, 229, 1),
        Color.fromRGBO(255, 255, 255, 0),
        Color.fromRGBO(251, 178, 150, 1),
      ],
    ).createShader(const Rect.fromLTWH(2000.0, 200.0, 200.0, 70.0));

    _timer;
    // var assetsImage =  AssetImage(
    //     'images/new_logo.png'); //<- Creates an object that fetches an image.
    // var image = new Image(
    //     image: assetsImage,
    //     height: 300); //<- Creates a widget that displays an image.

    return Scaffold(
      /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: change ? backgroundcolor2 : backgr),
        child: Center(
            child: change
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/7.png"),
                            ),
                          ),
                        ),
                        Text("Air Play",
                            style: GoogleFonts.rambla(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/9.png"),
                            ),
                          ),
                        ),
                        Text("Air Play",
                            style: GoogleFonts.rambla(
                              color: regular,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  )),
      ), //<- place where the image appears
    );
  }
}

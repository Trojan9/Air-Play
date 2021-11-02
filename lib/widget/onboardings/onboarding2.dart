import 'package:Airplay/ui/auth/login.dart';
import 'package:Airplay/ui/auth/signup.dart';
import 'package:Airplay/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:Airplay/utils/buttons/custom_button.dart';
import 'package:Airplay/utils/buttons/textbutton.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding2 extends StatefulWidget {
  final Function() notifyParent;

  const Onboarding2({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  void skip() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
    // print("okay");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor2,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                verticalSpaceLarge,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("Airplay",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: backgroundcolor2,
                    image: const DecorationImage(
                      image: AssetImage("assets/6.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("Local Storage",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      "Hot singles looking to link up with their taste, join now to meet up with various people.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: regular),
                    )),
                // verticalSpaceMedium,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      TextButtonArrow(
                        fn: skip,
                        text: 'SKip',
                        colors: regular,
                      ),
                      TextButtonArrow(
                        fn: widget.notifyParent,
                        text: 'Next',
                        colors: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

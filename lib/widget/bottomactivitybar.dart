import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomActivityBar extends StatefulWidget {
  const BottomActivityBar({Key? key}) : super(key: key);

  @override
  _BottomActivityBarState createState() => _BottomActivityBarState();
}

class _BottomActivityBarState extends State<BottomActivityBar> {
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height / 1.5,
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(2, 53, 60, 1),
              borderRadius: BorderRadius.circular(200)),
          width: wholescreenWidth(context) / 1.08,
          height: MediaQuery.of(context).size.height / 9,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: Image.asset(
                      "assets/song.png",
                      height: MediaQuery.of(context).size.height / 12,
                      width: wholescreenWidth(context) / 8,
                      fit: BoxFit.fill,
                    )),
                Container(
                  width: wholescreenWidth(context) / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          size: 14,
                          color: backgroundcolor1,
                          fontWeight: FontWeight.w400,
                          text: "Playlist 1"),
                      verticalSpaceSmall,
                      Text("Mayorkun & Victony",
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                            color: regular,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: wholescreenWidth(context) / 2.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous_sharp,
                            size: 25,
                            color: backgroundcolor2,
                          )),
                      playing
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  playing = false;
                                });
                              },
                              icon: Icon(
                                Icons.pause_sharp,
                                size: 25,
                                color: backgroundcolor2,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  playing = true;
                                });
                              },
                              icon: Icon(
                                Icons.play_arrow_sharp,
                                size: 25,
                                color: backgroundcolor2,
                              )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next_sharp,
                            size: 25,
                            color: backgroundcolor2,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

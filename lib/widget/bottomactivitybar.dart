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
        top: MediaQuery.of(context).size.height / 1.68,
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor, // const Color.fromRGBO(2, 53, 60, 1),
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                // offset: Offset(0, 3),
              ),
            ],
          ),
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
                      height: MediaQuery.of(context).size.height / 13,
                      width: wholescreenWidth(context) / 7,
                      fit: BoxFit.cover,
                    )),
                Container(
                  width: wholescreenWidth(context) / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        size: 14,
                        color: (Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color)!, //backgroundcolor1,
                        fontWeight: (Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .fontWeight)!,
                        text: "Playlist 1",
                      ),
                      verticalSpaceSmall,
                      Text(
                        "Mayorkun & Victony",
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                          color: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .color)!, // regular,
                          fontSize: 14,
                          fontWeight: (Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .fontWeight)!,
                        ),
                      ),
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
                          size: 35,
                          color: backgroundcolor2,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                      playing
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  playing = false;
                                });
                              },
                              icon: Icon(
                                Icons.pause_sharp,
                                size: 35,
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
                                size: 35,
                                color: backgroundcolor2,
                              ),
                              padding: EdgeInsets.all(0),
                            ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_next_sharp,
                          size: 35,
                          color: backgroundcolor2,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';

class PlaylistDriveLV extends StatefulWidget {
  const PlaylistDriveLV({Key? key}) : super(key: key);

  @override
  _PlaylistDriveLVState createState() => _PlaylistDriveLVState();
}

class _PlaylistDriveLVState extends State<PlaylistDriveLV> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: wholescreenWidth(context),
                  height: MediaQuery.of(context).size.height / 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 8, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  size: 16,
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
                                CustomText(
                                  size: 15,
                                  color: (Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .color)!, // regular,
                                  fontWeight: (Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .fontWeight)!, //FontWeight.normal,
                                  text: "Mayorkun & Victony",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: wholescreenWidth(context) / 2.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       Icons.favorite,
                                  //       size: 25,
                                  //       color: regular,
                                  //     )),
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
    );
  }
}

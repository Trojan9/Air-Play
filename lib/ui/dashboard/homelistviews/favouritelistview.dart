import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';

class FavouriteLV extends StatefulWidget {
  const FavouriteLV({Key? key}) : super(key: key);

  @override
  _FavouriteLVState createState() => _FavouriteLVState();
}

class _FavouriteLVState extends State<FavouriteLV> {
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
                  color: backgroundcolor2,
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
                                    size: 14,
                                    color: backgroundcolor1,
                                    fontWeight: FontWeight.w400,
                                    text: "Holy Father"),
                                verticalSpaceSmall,
                                CustomText(
                                    size: 14,
                                    color: regular,
                                    fontWeight: FontWeight.w400,
                                    text: "Mayorkun & Victony")
                              ],
                            ),
                            SizedBox(
                              width: wholescreenWidth(context) / 2.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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

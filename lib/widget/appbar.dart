import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';

class Appbars extends StatelessWidget {
  const Appbars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: wholescreenWidth(context),
        color: backgroundcolor2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: wholescreenWidth(context) / 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/icon.png"),
                    SizedBox(
                      width: wholescreenWidth(context) / 20,
                    ),
                    CustomText(
                        size: 18,
                        color: regular,
                        fontWeight: FontWeight.w400,
                        text: "Air Play"),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: wholescreenWidth(context) / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.brightness_2,
                        size: 25,
                        color: regular,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
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
    );
  }
}

import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:flutter/material.dart';

class SubMenu extends StatefulWidget {
  final Function(int page) notifyParent;
  const SubMenu({Key? key, required this.notifyParent}) : super(key: key);

  @override
  _SubMenuState createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              page = 0;
              widget.notifyParent(0);
            });
          },
          child: CustomText(
              size: 14,
              color: page == 0 ? backgroundcolor1 : regular,
              fontWeight: FontWeight.w400,
              text: "Favourites"),
        ),
        InkWell(
          onTap: () {
            setState(() {
              page = 1;
              widget.notifyParent(1);
            });
          },
          child: CustomText(
              size: 14,
              color: page == 1 ? backgroundcolor1 : regular,
              fontWeight: FontWeight.w400,
              text: "Playlist"),
        ),
        InkWell(
          onTap: () {
            setState(() {
              page = 2;
              widget.notifyParent(2);
            });
          },
          child: CustomText(
              size: 14,
              color: page == 2 ? backgroundcolor1 : regular,
              fontWeight: FontWeight.w400,
              text: "Songs"),
        ),
      ],
    );
  }
}

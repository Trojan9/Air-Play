import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/appbar.dart';
import 'package:Airplay/widget/submenu.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final Function(int page) notifyParent;
  const CustomAppBar({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Appbars(),
        verticalSpaceMedium,
        SubMenu(notifyParent: widget.notifyParent),
        verticalSpaceMedium,
        Container(
          height: 2,
          color: regular,
          width: wholescreenWidth(context),
        ),
        // FavouriteLV(),
      ],
    );
  }
}

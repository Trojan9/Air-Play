import 'package:Airplay/ui/dashboard/homelistviews/favouritelistview.dart';
import 'package:Airplay/ui/dashboard/homelistviews/playlistlistview.dart';
import 'package:Airplay/ui/dashboard/homelistviews/sondslistview.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/appbar.dart';
import 'package:Airplay/widget/appbar/customappbar.dart';
import 'package:Airplay/widget/bottomactivitybar.dart';
import 'package:Airplay/widget/customtext.dart';
import 'package:Airplay/widget/submenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;

  refresh(int pageNo) {
    setState(() {
      page = pageNo;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(125),
            child: CustomAppBar(notifyParent: refresh)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: page == 0
                  ? FavouriteLV()
                  : page == 1
                      ? PlaylistLV()
                      : SongsLV(),
            ),
            BottomActivityBar()
          ],
        ));
  }
}

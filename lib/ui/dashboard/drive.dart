import 'package:Airplay/ui/dashboard/driveLIstview/favouritelistview.dart';
import 'package:Airplay/ui/dashboard/driveLIstview/playlistlistview.dart';
import 'package:Airplay/ui/dashboard/driveLIstview/sondslistview.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/widget/appbar/customappbar.dart';
import 'package:Airplay/widget/bottomactivitybar.dart';
import 'package:flutter/material.dart';

class Drive extends StatefulWidget {
  const Drive({Key? key}) : super(key: key);

  @override
  _DriveState createState() => _DriveState();
}

class _DriveState extends State<Drive> {
  int page = 0;

  refresh(int pageno) {
    setState(() {
      page = pageno;
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
        backgroundColor: backgroundcolor2,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: page == 0
                  ? FavouriteDriveLV()
                  : page == 1
                      ? PlaylistDriveLV()
                      : SongsDriveLV(),
            ),
            BottomActivityBar()
          ],
        ));
  }
}

import 'package:Airplay/ui/dashboard/drive.dart';
import 'package:Airplay/ui/dashboard/home.dart';
import 'package:Airplay/ui/profile/profile.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/scaffoldkeys.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: backgroundcolor2,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: const <Widget>[
            Home(),
            Drive(),
            Profile(),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          child: BottomAppBar(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(width: 10),
                  GestureDetector(
                      onTap: () => _pageController.jumpToPage(0),
                      child: _page == 0
                          ? Image.asset("assets/icon1.png")
                          : InkWell(
                              child: Image.asset("assets/icon.png"),
                            )),
                  GestureDetector(
                    onTap: () => _pageController.jumpToPage(1),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.library_music,
                            size: 34.0,
                            color: _page == 1 ? backgroundcolor1 : regular,
                          ),

                          // onPressed: () => _pageController.jumpToPage(0),

                          //SizedBox(height: 1.0,),
                        ]),
                  ),
                  GestureDetector(
                    onTap: () => _pageController.jumpToPage(2),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_pin,
                            size: 34.0,
                            color: _page == 2 ? backgroundcolor1 : regular,
                          ),

                          // onPressed: () => _pageController.jumpToPage(0),

                          //SizedBox(height: 1.0,),
                        ]),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            //color: Theme.of(context).primaryColor,
            //   shape: CircularNotchedRectangle(),
          ),
        ),
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniCenterDocked,
        // floatingActionButton: FloatingActionButton(
        //   //backgroundColor:Colors.lightBlue ,
        //   elevation: 4.0,
        //   child: Container(
        //     width: 60,
        //     height: 60,
        //     child: Icon(
        //       Icons.add,
        //       size: 30,
        //     ),
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       gradient: LinearGradient(colors: [
        //         Colors.lightBlue[600],
        //         Colors.lightBlue[300],
        //         Colors.lightBlue[200],
        //         Colors.lightBlue[100],
        //       ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        //     ),
        //   ),
        //   onPressed: () => _pageController.jumpToPage(2),
        // ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    scaffoldKey.add(GlobalKey<ScaffoldState>());
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}

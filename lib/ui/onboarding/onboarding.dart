// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/widget/onboardings/onboarding1.dart';
import 'package:Airplay/widget/onboardings/onboarding2.dart';
import 'package:Airplay/widget/onboardings/onboarding3.dart';
import 'package:flutter/material.dart';
import 'package:Airplay/utils/colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // ignore: non_constant_identifier_names

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  refresh() {
    setState(() {
      if (_currentPage < 2) {
        _currentPage = _currentPage + 1;
        _pageController.jumpToPage(_currentPage);
      }
    });
  }

  void next() {
    setState(() {
      if (_currentPage < 3) {
        _currentPage = _currentPage + 1;
      }
    });
  }

  void skip() {
    // print("okay");
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 15.0 : 10.0,
      width: isActive ? 15.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? regular : backgroundcolor1,
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Onboarding1(
                notifyParent: refresh,
              ),
              Onboarding2(
                notifyParent: refresh,
              ),
              Onboarding3(
                notifyParent: refresh,
              )
            ]),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.8,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

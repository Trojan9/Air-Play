import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Airplay/utils/colors.dart';

class RegText extends StatelessWidget {
  late double size;
  RegText({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Airplay",
        style: GoogleFonts.rambla(
          color: regular,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ));
  }
}

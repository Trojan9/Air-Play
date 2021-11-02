import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Airplay/utils/colors.dart';

class CustomText extends StatefulWidget {
  final double size;
  final String text;
  final FontWeight fontWeight;
  final Color color;
  CustomText(
      {Key? key,
      required this.size,
      required this.color,
      required this.fontWeight,
      required this.text})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: GoogleFonts.montserrat(
          color: widget.color,
          fontSize: widget.size,
          fontWeight: widget.fontWeight,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonArrow extends StatefulWidget {
  final String text;
  void Function() fn;
  Color colors;
  TextButtonArrow(
      {Key? key, required this.text, required this.fn, required this.colors})
      : super(key: key);

  @override
  _TextButtonArrowState createState() => _TextButtonArrowState();
}

class _TextButtonArrowState extends State<TextButtonArrow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fn,
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: widget.colors),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: widget.colors,
              )
            ],
          ),
        ),
      ),
    );
  }
}

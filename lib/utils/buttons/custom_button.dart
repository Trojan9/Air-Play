import 'dart:io';
import 'package:Airplay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../spacing.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text_in,
    required this.borderColor,
    required this.onPressed,
    this.checkicon = false,
    this.busy = false,
    required this.newWidget,
    this.textColor = Colors.white,
    this.buttonColor = const Color(0xff03588C),
    required this.title,
    required this.fontSize,
  }) : super(key: key);
  final double height;
  final double width;
  final Function() onPressed;
  final bool busy;
  final String text_in;
  final newWidget;
  final bool checkicon;
  final Color textColor, borderColor;

  final Color buttonColor;
  final String title;
  final double fontSize;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.busy ? null : widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x20000000),
              spreadRadius: 0.0,
              offset: Offset(3.5, 5.0),
            ),
          ],
          color: widget.busy
              ? backgroundcolor2.withOpacity(0.2)
              : backgroundcolor2,
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: widget.buttonColor.withOpacity(0.2), width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.busy)
              Platform.isIOS
                  ? const CupertinoActivityIndicator(radius: 12)
                  : Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: const CircularProgressIndicator(
                            strokeWidth: 4.0,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        horizontalSpaceMedium,
                        Text(
                          widget.text_in,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                        // CustomText(widget.title,
                        //     letterSpacing: 0.5,
                        //     color: widget.textColor,
                        //     fontSize: screenAwareSize(
                        //         screenAwareSize(widget.fontSize, context,
                        //             width: true),
                        //         context),
                        //     fontWeight: FontWeight.w700),
                      ],
                    )
            else
              Row(
                children: [
                  widget.checkicon ? widget.newWidget : SizedBox(),
                  widget.checkicon ? horizontalSpaceSmall : SizedBox(width: 0),
                  Text(
                    widget.text_in,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                  // CustomText(widget.title,
                  //     letterSpacing: 0.5,
                  //     color: widget.textColor,
                  //     fontSize: screenAwareSize(
                  //         screenAwareSize(widget.fontSize ?? 12, context,
                  //             width: true),
                  //         context),
                  //     fontWeight: FontWeight.w700),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

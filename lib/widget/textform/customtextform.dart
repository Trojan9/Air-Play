import 'package:flutter/material.dart';
import 'package:Airplay/utils/colors.dart';
import 'package:Airplay/utils/spacing.dart';
import 'package:Airplay/widget/customtext.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.enabled = true,
      this.autoFocus = false,
      this.inputType,
      this.inputAction,
      this.focusNode,
      this.maxLength,
      this.maxLines,
      this.labelText,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.hintText,
      this.fillColor,
      this.titleColor,
      this.title,
      this.obscure})
      : super(key: key);
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;
  final bool? obscure;
  final Color? titleColor, fillColor;

  final bool autoFocus;
  final String? labelText, title;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool? obscure;

  @override
  void initState() {
    obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceTiny,
        Container(
          // height: 40,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: WidgetsBinding.instance.window.viewInsets.bottom != 0
            //     ? null
            //     : const <BoxShadow>[
            //   BoxShadow(
            //     blurRadius: 5.0,
            //     color: Color(0x10000000),
            //     spreadRadius: 5.0,
            //     offset: Offset(3.5, 5.0),
            //   ),
            // ]
          ),
          child: TextFormField(
            keyboardType: widget.inputType,
            controller: widget.controller,
            textInputAction: widget.inputAction,
            //  widget.inputAction,
            // maxLength: widget.maxLength,
            autofocus: widget.autoFocus,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            obscureText: obscure ?? false,
            cursorColor: Colors.black,
            style:
                TextStyle(color: regular, fontSize: 18, fontFamily: 'Brandon'),
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelText: widget.labelText,
              fillColor: regular,
              filled: true,
              hintStyle: TextStyle(
                  color: regular.withOpacity(0.2),
                  fontSize: 15,
                  fontFamily: 'Brandon'),
              hintText: widget.hintText,
              labelStyle: const TextStyle(
                  color: Colors.grey, fontSize: 15, fontFamily: 'Brandon'),
              errorStyle: const TextStyle(color: Color(0xff222222)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8),
              //   borderSide:
              //       const BorderSide(color: Colors.lightGreen, width: 2),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8),
              //   borderSide:
              //       const BorderSide(color: Color(0xffcccccc), width: 1),
              // ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8),
              //   borderSide:
              //       const BorderSide(color: Color(0xffcccccc), width: 1),
              // ),

              counterText: '',
              suffixIcon: obscure == null
                  ? null
                  : IconButton(
                      icon: obscure!
                          ? Icon(Icons.visibility_off,
                              color: Colors.black.withOpacity(0.3))
                          : Icon(Icons.visibility,
                              color: Colors.black.withOpacity(0.5)),
                      onPressed: () {
                        setState(
                          () {
                            obscure = !obscure!;
                          },
                        );
                      },
                    ),
            ),
            validator: widget.validator,
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: regular,
        )
      ],
    );
  }
}

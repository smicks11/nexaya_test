import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  const TextView({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.radley(
        textStyle: TextStyle(
          color: color ?? Theme.of(context).colorScheme.primary,
          fontWeight: fontWeight,
          fontSize: fontSize ?? 14.sp,
          fontStyle: fontStyle,
        ),
      ),
      textAlign: textAlign,
    );
  }
}

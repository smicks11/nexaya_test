import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexaya/shared/colors.dart';

class Alert {
  final String message;

  const Alert({
    required this.message,
  });

  static show(BuildContext context,
      {required String message, required bool error}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0.0,
        content: Text(
          message,
          style: GoogleFonts.comfortaa(
            color: AppColors.white,
            fontSize: 12.sp,
          ),
        ),
        duration: const Duration(seconds: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
              bottomRight: Radius.circular(4.0),
              bottomLeft: Radius.circular(4.0)),
        ),
        backgroundColor: error == true ? AppColors.errorColor : Colors.green));
  }
}

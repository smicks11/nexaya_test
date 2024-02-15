import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexaya/shared/colors.dart';
import 'package:nexaya/shared/text.dart';

class ProfileTiles extends StatelessWidget {
  final String title;
  final String data;
  const ProfileTiles({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextView(
        text: title,
        fontWeight: FontWeight.bold,
        fontSize: 13.sp,
      ),
      subtitle: TextView(
        text: data,
        fontWeight: FontWeight.bold,
        fontSize: 10.sp,
        color: AppColors.disabledTextColor,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.disabledTextColor,
      ),
    );
  }
}

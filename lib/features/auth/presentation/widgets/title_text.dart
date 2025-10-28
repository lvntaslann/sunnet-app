import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.appColors,
    required this.titleText,
  });

  final AppColors appColors;
  final titleText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: Text(
        titleText,
        style: TextStyle(
          color: appColors.authPage.textColor,
          fontSize: AppFontSizes.s16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
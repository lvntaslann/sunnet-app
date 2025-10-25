import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';

class KuranSlideActions extends StatelessWidget {
  const KuranSlideActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return Positioned(
      bottom: 20.h,
      right: 20.w,
      child: Column(
        children: [
          Icon(
            Icons.question_mark,
            color: appColors.hadisPage.iconColor,
            size: 30.sp,
          ),
          SizedBox(height: 15.h),
          Icon(
            Icons.favorite_outline,
            color: appColors.hadisPage.iconColor,
            size: 30.sp,
          ),
          SizedBox(height: 15.h),
          Icon(
            Icons.share,
            color: appColors.hadisPage.iconColor,
            size: 30.sp,
          ),
        ],
      ),
    );
  }
}

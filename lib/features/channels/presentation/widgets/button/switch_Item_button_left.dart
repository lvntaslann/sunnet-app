import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';

class SwitchItemButtonLeft extends StatelessWidget {
  const SwitchItemButtonLeft({
    super.key,
    required this.appColors,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final AppColors appColors;
  final String title;
  final bool isActive;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 163.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: isActive
              ? appColors.channelsPage.switchPanelActiveColor
              : appColors.channelsPage.switchPanelPassiveColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            bottomLeft: Radius.circular(22.r),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive
                  ? appColors.channelsPage.textColor
                  : appColors.channelsPage.switchPanelPassiveTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String statusText;
  final bool isCompleted;
  final AppColors appColors;

  const TaskItem({
    required this.title,
    required this.statusText,
    required this.isCompleted,
    required this.appColors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusColor = isCompleted
        ? appColors.profilePage.contentCompletedColor
        : appColors.profilePage.contentNotCompletedColor;

    return Container(
      width: 347.w,
      height: 78.h,
      decoration: BoxDecoration(
        color: appColors.profilePage.contentContainerBgColor.withOpacity(0.11),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: appColors.profilePage.contentIconContainerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/bottom_nav_bar/hadis-active.png"),
              ),
              SizedBox(width: 15.w),
              Text(
                title,
                style: TextStyle(
                  color: appColors.profilePage.textColor,
                  fontSize: AppFontSizes.s14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Container(
            width: 92.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                statusText,
                style: TextStyle(
                  color: appColors.profilePage.textColor,
                  fontSize: AppFontSizes.s12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

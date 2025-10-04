import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class DailyGoalSection extends StatelessWidget {
  final AppColors appColors;
  final double progress;

  const DailyGoalSection({
    required this.appColors,
    required this.progress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bugünün Hedefi",
                style: TextStyle(
                  color: appColors.profilePage.textColor,
                  fontSize: AppFontSizes.s16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "750/1000",
                style: TextStyle(
                  color: appColors.profilePage.textColor,
                  fontSize: AppFontSizes.s16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          width: 300.w,
          height: 15.h,
          decoration: BoxDecoration(
            color: appColors.profilePage.dailyStatusNotCompletedColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                appColors.profilePage.dailyStatusCompletedColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

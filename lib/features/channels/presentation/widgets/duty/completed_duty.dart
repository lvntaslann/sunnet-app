import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/font_size.dart';

class CompletedDuty extends StatelessWidget {
  const CompletedDuty({
    super.key,
    required this.appColors,
    required this.completedDuties,
  });

  final AppColors appColors;
  final int completedDuties;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tamamlanan\ngörev sayısı",
          style: TextStyle(
            color: appColors.channelsPage.textColor,
            fontSize: AppFontSizes.custom(10),
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          width: 58.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: appColors.channelsPage.dutyCompletedCountBgColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Center(
            child: Text(
              completedDuties.toString(),
              style: TextStyle(
                color: appColors.channelsPage.dutyCompletedCountTextColor,
                fontSize: AppFontSizes.s12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
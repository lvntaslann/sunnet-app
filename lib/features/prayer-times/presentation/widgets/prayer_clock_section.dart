import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class PrayerClockSection extends StatelessWidget {
  final String hour;
  final String minute;
  final AppColors appColors;

  const PrayerClockSection({
    super.key,
    required this.hour,
    required this.minute,
    required this.appColors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeBox(hour),
        SizedBox(width: 10.w),
        Text(
          ":",
          style: TextStyle(
            color: appColors.prayerPage.titleTextColor,
            fontSize: AppFontSizes.s40,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(width: 10.w),
        _buildTimeBox(minute),
      ],
    );
  }

  Widget _buildTimeBox(String text) {
    return Container(
      width: 120.w,
      height: 108.h,
      decoration: BoxDecoration(
        color: appColors.prayerPage.contentContainerBgColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: appColors.prayerPage.contentContainerStrokeColor,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: appColors.prayerPage.titleTextColor,
            fontSize: AppFontSizes.s40,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

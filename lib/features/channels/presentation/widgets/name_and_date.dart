import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class NameAndDate extends StatelessWidget {
  const NameAndDate({
    super.key,
    required this.name,
    required this.appColors,
    required this.joinDate,
  });

  final String name;
  final AppColors appColors;
  final String joinDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: appColors.channelsPage.textColor,
            fontSize: AppFontSizes.s18,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          joinDate,
          style: TextStyle(
            color: appColors.channelsPage.textColor,
            fontSize: AppFontSizes.s12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/font_size.dart';

class ChannelDefaultButton extends StatelessWidget {
  const ChannelDefaultButton({
    super.key,
    required this.appColors,
    required this.title,
    required this.onTap
  });

  final AppColors appColors;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 337.w,
        height: 52.h,
        decoration: BoxDecoration(
          color: appColors.channelsPage.createNewContentButtonColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: AppFontSizes.s18,
              color: appColors.channelsPage.createNewContentTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
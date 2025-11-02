import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';

class DefaultDropdownButton extends StatelessWidget {
  const DefaultDropdownButton({
    super.key,
    required this.appColors,
    required this.isTappedButton,
  });

  final AppColors appColors;
  final bool isTappedButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: appColors.channelsPage.dutyCompletedCountBgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(
        isTappedButton
            ? Icons.arrow_drop_up
            : Icons.arrow_drop_down,
        size: 20.w,
        color: appColors.channelsPage.dutyCompletedCountTextColor,
      ),
    );
  }
}
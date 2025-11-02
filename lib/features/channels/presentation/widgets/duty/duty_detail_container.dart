import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';

class DutyDetailContainer extends StatelessWidget {
  const DutyDetailContainer({
    super.key,
    required this.appColors,
    required this.duties,
  });

  final AppColors appColors;
  final List<String> duties;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColors.channelsPage.dutyDetailBgColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: appColors.channelsPage.dutyDetailBorderColor,
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: duties.map((duty) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• ",
                    style: TextStyle(
                      color: appColors.channelsPage.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      duty,
                      style: TextStyle(
                        color: appColors.channelsPage.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
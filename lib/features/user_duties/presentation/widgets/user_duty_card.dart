import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../data/model/user_duty_model.dart';

class UserDutyCard extends StatelessWidget {
  final UserDutyModel duty;
  final AppColors appColors;
  final Function(String dutyId, String currentStatus)? onToggleStatus;

  const UserDutyCard({
    Key? key,
    required this.duty,
    required this.appColors,
    this.onToggleStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusColor = duty.status == 'done'
        ? Colors.green
        : duty.status == 'in_progress'
            ? Colors.orange
            : Colors.grey;

    return GestureDetector(
      onTap: onToggleStatus != null
          ? () => onToggleStatus!(duty.dutyId, duty.status)
          : null,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: appColors.channelsPage.dutyDetailBgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: appColors.channelsPage.dutyDetailBorderColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    duty.channelName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    duty.status == 'done'
                        ? 'Tamamlandı'
                        : duty.status == 'in_progress'
                            ? 'Devam Ediyor'
                            : 'Bekliyor',
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              duty.dutyName,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (duty.tasks.isNotEmpty) ...[
              SizedBox(height: 8.h),
              ...duty.tasks.map((task) => Padding(
                    padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                    child: Row(
                      children: [
                        Icon(
                          duty.status == 'done' ? Icons.check_circle : Icons.radio_button_unchecked,
                          color: statusColor,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            task,
                            style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunnet_app/features/channels/presentation/widgets/duty/completed_duty.dart';
import 'package:sunnet_app/features/channels/presentation/widgets/duty/default_dropdown_button.dart';
import 'package:sunnet_app/features/channels/presentation/widgets/name_and_date.dart';
import 'package:sunnet_app/features/channels/presentation/widgets/user_profile_icon.dart';
import '../../../../../core/themes/app_colors.dart';
import 'duty_detail_container.dart';

class StudentDetail extends StatelessWidget {
  const StudentDetail({
    super.key,
    required this.appColors,
    required this.name,
    required this.joinDate,
    required this.completedDuties,
    required this.isUserOrDuty,
    required this.onTapDutyButton,
    required this.duties,
    required this.isTappedButton,
  });

  final AppColors appColors;
  final String name;
  final String joinDate;
  final int completedDuties;
  final bool isUserOrDuty;
  final Function() onTapDutyButton;
  final List<String> duties;
  final bool isTappedButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserProfileIcon(appColors: appColors),
              SizedBox(width: 15.w),
              Expanded(
                child: NameAndDate(
                  name: name,
                  appColors: appColors,
                  joinDate: joinDate,
                ),
              ),
              isUserOrDuty
                  ? CompletedDuty(
                      appColors: appColors,
                      completedDuties: completedDuties,
                    )
                  : InkWell(
                      onTap: onTapDutyButton,
                      borderRadius: BorderRadius.circular(10.r),
                      child: DefaultDropdownButton(appColors: appColors, isTappedButton: isTappedButton),
                    ),
            ],
          ),
          if (isTappedButton) ...[
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 55.w),
              child: DutyDetailContainer(appColors: appColors, duties: duties),
            ),
          ],
        ],
      ),
    );
  }
}





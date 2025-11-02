import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';

class UserProfileIcon extends StatelessWidget {
  const UserProfileIcon({super.key, required this.appColors});

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: appColors.channelsPage.profileIconBgColor,
        shape: BoxShape.circle,
      ),

      child: Icon(Icons.person, color: appColors.channelsPage.profileIconColor),
    );
  }
}
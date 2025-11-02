import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';
import '../../../auth/data/model/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final AppColors appColors;
  final UserModel user;

  const ProfileHeader({required this.appColors, required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: appColors.profilePage.profileContainerBgColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: Image.asset("assets/profile/profile_icon.png")),
        ),
        SizedBox(height: 5.h),
        Text(
          user.name,
          style: TextStyle(
            color: appColors.profilePage.textColor,
            fontSize: AppFontSizes.s18,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "Seviye 3 - 1200 puan",
          style: TextStyle(
            color: appColors.profilePage.levelTextColor,
            fontSize: AppFontSizes.s14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.appColors,
    required this.buttonText,
    required this.onTap,
  });

  final AppColors appColors;
  final String buttonText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 124.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: appColors.authPage.containerColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: appColors.authPage.containerShadowColor.withOpacity(
                  0.2,
                ),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: appColors.authPage.textColor,
                fontSize: AppFontSizes.s16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
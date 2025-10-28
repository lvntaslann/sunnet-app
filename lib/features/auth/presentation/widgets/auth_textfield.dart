import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({
    super.key,
    required this.appColors,
    required this.hintText,
    required this.controller,
    required this.isPassword,
  });

  final AppColors appColors;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: appColors.authPage.containerShadowColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: 
        TextField(
          controller: controller,
          cursorColor: appColors.authPage.textColor,
          style: TextStyle(color: appColors.authPage.textColor),
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: appColors.authPage.textColor.withOpacity(0.6)),
            filled: true,
            fillColor: appColors.authPage.containerColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
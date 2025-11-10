import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';

class JoinChannelButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isJoining;
  final AppColors appColors;

  const JoinChannelButton({
    Key? key,
    this.onPressed,
    required this.isJoining,
    required this.appColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isJoining ? Colors.grey : appColors.channelsPage.joinButtonBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),
      child: isJoining
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              'Katıl',
              style: TextStyle(
                color: appColors.channelsPage.joinButtonTextColor.withOpacity(0.9),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';
import '../button/join_channel_button.dart';

class DiscoverableChannelCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final int memberCount;
  final AppColors appColors;
  final VoidCallback? onJoinTap;
  final bool isJoining; // Yeni parametre

  const DiscoverableChannelCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.memberCount,
    required this.appColors,
    this.onJoinTap,
    this.isJoining = false, // Varsayılan değer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: appColors.channelsPage.joinButtonBgColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: appColors.channelsPage.joinButtonBorderColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: appColors.channelsPage.joinButtonIconBgColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Icon(
              Icons.campaign_rounded,
              color: appColors.channelsPage.joinButtonIconColor,
              size: 28,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: appColors.channelsPage.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.people_outline,
                      color: Colors.white60,
                      size: 14,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '$memberCount üye',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          JoinChannelButton(
            onPressed: onJoinTap,
            isJoining: isJoining,
            appColors: appColors,
          ),
        ],
      ),
    );
  }
}

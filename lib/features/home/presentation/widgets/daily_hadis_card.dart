import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/utils/font_size.dart';

class DailyHadisCard extends StatelessWidget {
  const DailyHadisCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return Container(
      width: double.infinity,
      height: 370.h,
      padding: EdgeInsets.all(12.w),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 50.h,
            child: Container(
              decoration: BoxDecoration(
                color: appColors.home.contentContainerBgColor,
                border: Border.all(
                  color: appColors.home.contentContainerStrokeColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Günün Hadisi",
                    style: TextStyle(
                      color: appColors.home.titleTextColor,
                      fontSize: AppFontSizes.s20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "“إِنَّمَا الأَعْمَالُ بِالنِّيَّةِ، وَإِنَّمَا لاِمْرِئٍ مَا نَوَى، فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ، فَهِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ، وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيبُهَا أَوِ امْرَأَةٍ يَتَزَوَّجُهَا، فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ.”",
                      style: TextStyle(
                        color: appColors.home.textColor,
                        fontSize: AppFontSizes.s16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "“Ameller niyete göredir. Herkes sadece niyetinin karşılığını alır. Kim Allah ve Resûlü için hicret ederse, hicreti Allah ve Resûlü’nedir. Kim de erişeceği bir dünyalık veya evleneceği bir kadından dolayı hicret ederse, onun hicreti de hicretine sebep olan şeyedir.”",
                    style: TextStyle(
                      color: appColors.home.contentTurkishTextColor,
                      fontSize: AppFontSizes.s14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: appColors.home.contentDetailBgColor,
                border: Border.all(
                  color: appColors.home.contentContainerStrokeColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Text(
                      "Buhârî, Bedü vahy, 1",
                      style: TextStyle(
                        color: appColors.home.contentTurkishTextColor,
                      ),
                    ),
                    SizedBox(width: 150.w),
                    Icon(
                      Icons.favorite,
                      color: appColors.home.contentIconColor,
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.share,
                      color: appColors.home.contentIconColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

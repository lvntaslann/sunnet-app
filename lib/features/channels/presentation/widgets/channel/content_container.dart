import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/font_size.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.appColors, required this.title, required this.subTitle,required this.onTap,
  });

  final AppColors appColors;
  final String title;
  final String subTitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 330.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: appColors.channelsPage.contentContainerBgColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
          color: appColors.channelsPage.joinButtonBorderColor.withOpacity(0.1),
          width: 1,
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppFontSizes.s20,
                      color: appColors.channelsPage.contentTitleColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 75.w),
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: appColors.channelsPage.buttonBgColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: onTap,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: appColors.channelsPage.buttonIconColor,
                          size: 30.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${subTitle} üye",
                style: TextStyle(
                  fontSize: AppFontSizes.s16,
                  color: appColors.channelsPage.contentSubtitleColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
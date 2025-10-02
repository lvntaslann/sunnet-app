import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunnet_app/core/themes/app_colors.dart';
import 'package:sunnet_app/core/widgets/custom_app_bar.dart';
import '../widgets/prayer_clock_section.dart';
import '../widgets/prayer_location_section.dart';
import '../widgets/prayer_time_section.dart';
import '../widgets/weather_section.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    final now = DateTime.now().toLocal();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: appColors.prayerPage.pageBgColor,
      appBar: CustomAppBar(title: "Namaz saatleri", showBackButton: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            // lokasyon + en yakın cami
            PrayerLocationSection(appColors: appColors),
            SizedBox(height: 20.h),
            // saat
            PrayerClockSection(
              hour: hour,
              minute: minute,
              appColors: appColors,
            ),
            SizedBox(height: 20.h),
            // hava durumu
            WeatherSection(appColors: appColors),
            SizedBox(height: 20.h),
            // namaz vakitleri
            PrayerTimesSection(appColors: appColors),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

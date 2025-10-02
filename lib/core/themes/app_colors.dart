import 'package:sunnet_app/core/themes/abdest/abdest_page_colors.dart';
import 'package:sunnet_app/core/themes/hadis/hadis_page_colors.dart';
import 'package:sunnet_app/core/themes/home/home_colors.dart';
import 'package:sunnet_app/core/themes/prayer/prayer_page_colors.dart';

class AppColors {

  final HomeColors home;
  final AbdestPageColors abdestPage;
  final HadisPageColors hadisPage;
  final PrayerPageColors prayerPage;
  AppColors({required bool isDarkMode})
    : home = HomeColors(isDarkMode: isDarkMode),
      abdestPage = AbdestPageColors(isDarkMode: isDarkMode),
      hadisPage  = HadisPageColors(isDarkMode: isDarkMode),
      prayerPage = PrayerPageColors(isDarkMode: isDarkMode);
}
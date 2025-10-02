
import 'dart:ui';

class PrayerPageColors {
  final bool isDarkMode;

  const PrayerPageColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF0C1A12);
  Color get contentContainerBgColor => isDarkMode ? const Color(0xFF121212) :  Color(0xFF1F4830);
  Color get contentContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get titleTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get topTimeTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFF933A);

  Color get currentTimeContainerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF132C1E);
  Color get currentTimeContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  
  Color get currentDayTimeTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get currentNightTimeTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF9E9B9B);

  Color get prayerTimeContainerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get prayerTimeContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF30DA7B);
  Color get prayerTitleTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF4A4949);
  Color get prayerTimeTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF1C1C1C);




}
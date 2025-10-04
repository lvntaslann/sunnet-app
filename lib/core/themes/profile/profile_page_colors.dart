
import 'dart:ui';

class ProfilePageColors {
  final bool isDarkMode;

  const ProfilePageColors({required this.isDarkMode});
  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF0C1A12);
  Color get profileContainerBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFD9D9D9);
  Color get textColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get levelTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF1C8241);
  Color get dailyStatusCompletedColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF22C55E);
  Color get dailyStatusNotCompletedColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF5A7D67);
  Color get contentContainerBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF22C55E);
  Color get contentIconContainerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF1A3E2A);
  Color get contentCompletedColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF25DB67);
  Color get contentNotCompletedColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF1C8241);
}
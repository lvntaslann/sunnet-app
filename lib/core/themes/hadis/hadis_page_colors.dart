
import 'dart:ui';

class HadisPageColors {
  final bool isDarkMode;

  const HadisPageColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF0C1A12);
  Color get contentContainerBgColor => isDarkMode ? const Color(0xFF121212) :  Color(0xFF1A3E2A);
  Color get contentContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF58A47A);
  Color get titleTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF22C55E);
  Color get turkishTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFBBC6D0);
  Color get hadisTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get iconColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFBBC6D0);


}
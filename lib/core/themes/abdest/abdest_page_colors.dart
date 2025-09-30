
import 'dart:ui';

class AbdestPageColors {
  final bool isDarkMode;

  const AbdestPageColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF0C1A12);
  Color get contentContainerBgColor => isDarkMode ? const Color(0xFF121212) :  Color(0xFF1F4830);
  Color get contentContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get textColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);



}
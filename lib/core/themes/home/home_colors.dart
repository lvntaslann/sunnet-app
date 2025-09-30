
import 'dart:ui';

class HomeColors {
  final bool isDarkMode;

  const HomeColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF0C1A12);
  Color get contentContainerBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF1A3E2A);
  Color get contentDetailBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF274B37);
  Color get contentContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF58A47A);
  Color get contentTurkishTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFBBC6D0);
  Color get contentIconColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFBBC6D0);
  Color get titleTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF22C55E);
  Color get miniContainerBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF203429);
  Color get miniContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF2C4637);
  Color get textColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);



}
import 'dart:ui';

class AuthPageColors {
  final bool isDarkMode;

  const AuthPageColors({required this.isDarkMode});
  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF0C1A12);
  Color get textColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get containerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF58A47A);
  Color get containerShadowColor => isDarkMode ? const Color(0xFF121212): const Color(0xFF03FC72);
  Color get dontHaveAccountTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF58A47A);
}
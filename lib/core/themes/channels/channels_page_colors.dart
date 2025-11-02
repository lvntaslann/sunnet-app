import 'dart:ui';

class ChannelsPageColors {
    final bool isDarkMode;

  const ChannelsPageColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF0C1A12);
  Color get contentContainerBgColor => isDarkMode ? const Color(0xFF121212) :  Color(0xFFFFFFFF);
  Color get contentContainerStrokeColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF58A47A);
  Color get textColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get buttonBgColor => isDarkMode ? const Color(0xFF121212): const Color(0xFFECEBEB);
  Color get buttonIconColor => isDarkMode ? const Color(0xFF121212): const Color(0xFF22C55E);
  Color get contentTitleColor => isDarkMode ? const Color(0xFF121212): const Color(0xFF152A1E);
  Color get contentSubtitleColor => isDarkMode ? const Color(0xFF121212): const Color(0xFF545353);
  Color get createNewContentButtonColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF1C8241);
  Color get createNewContentTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get switchPanelActiveColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF2D764C);
  Color get switchPanelPassiveColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get switchPanelPassiveTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF494949);

  Color get profileIconBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFD9D9D9);
  Color get profileIconColor => isDarkMode ? const Color(0XFF121212): const Color(0xFF1C8241);
  Color get dutyCompletedCountBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get dutyCompletedCountTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF494949);
  Color get dutyDetailBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF22C55E);
  Color get dutyDetailBorderColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF494949);

}

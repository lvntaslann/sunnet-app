import 'package:shared_preferences/shared_preferences.dart';

class FetchTimeUtil {
  static const String _lastFetchKey = "last_fetch_time";
  static const String _prayerTimesKey = "prayer_times_data";
  static const String _weatherKey = "weather_data";

  static Future<bool> shouldFetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchMillis = prefs.getInt(_lastFetchKey);
    if (lastFetchMillis == null) return true; // hiç fetch yapılmamışsa
    final lastFetch = DateTime.fromMillisecondsSinceEpoch(lastFetchMillis);
    final now = DateTime.now();
    return now.difference(lastFetch).inHours >= 24;
  }

  static Future<void> updateFetchTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastFetchKey, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<void> savePrayerTimes(String jsonData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prayerTimesKey, jsonData);
  }

  static Future<String?> getPrayerTimes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_prayerTimesKey);
  }

  static Future<void> saveWeather(String jsonData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_weatherKey, jsonData);
  }

  static Future<String?> getWeather() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_weatherKey);
  }
}

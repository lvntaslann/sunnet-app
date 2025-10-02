import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/prayer_time_model.dart';

class PrayerTimeService {
  final String baseUrl;

  PrayerTimeService({required this.baseUrl});

  Future<PrayerTimesResponse> fetchPrayerTimes({
    required double lat,
    required double lng,
    required String date,
    int days = 3,
    int timezoneOffset = 180,
    String calculationMethod = "Turkey",
    String lang = "tr",
  }) async {
    final url =
        "$baseUrl?lat=$lat&lng=$lng&date=$date&days=$days&timezoneOffset=$timezoneOffset&calculationMethod=$calculationMethod&lang=$lang";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return PrayerTimesResponse.fromJson(body);
    } else {
      throw Exception("Failed to load prayer times");
    }
  }
}

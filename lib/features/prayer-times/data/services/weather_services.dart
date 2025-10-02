import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_report.dart';

class WeatherService {
  final String apiKey;
  final String baseUrl;

  WeatherService({required this.apiKey, required this.baseUrl});

  Future<List<WeatherReport>> fetchWeather(double lat, double lon) async {
    final url =
        "$baseUrl?key=$apiKey&location.latitude=$lat&location.longitude=$lon";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List forecasts = body['forecastDays'] ?? [];

      return forecasts
          .map((f) => WeatherReport.fromJson(f))
          .toList()
          .cast<WeatherReport>();
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}

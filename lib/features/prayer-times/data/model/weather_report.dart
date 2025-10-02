class WeatherReport {
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final String dayConditionText;
  final String dayIconUrl;
  final String nightConditionText;
  final String nightIconUrl;

  WeatherReport({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.dayConditionText,
    required this.dayIconUrl,
    required this.nightConditionText,
    required this.nightIconUrl,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) {
    return WeatherReport(
      date: DateTime(
        json['displayDate']['year'],
        json['displayDate']['month'],
        json['displayDate']['day'],
      ),
      maxTemp: (json['maxTemperature']['degrees'] ?? 0).toDouble(),
      minTemp: (json['minTemperature']['degrees'] ?? 0).toDouble(),
      dayConditionText: json['daytimeForecast']['weatherCondition']['description']['text'] ?? "",
      dayIconUrl: (json['daytimeForecast']['weatherCondition']['iconBaseUri'] ?? "") + ".png",
      nightConditionText: json['nighttimeForecast']['weatherCondition']['description']['text'] ?? "",
      nightIconUrl: (json['nighttimeForecast']['weatherCondition']['iconBaseUri'] ?? "") + ".png",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'dayConditionText': dayConditionText,
      'dayIconUrl': dayIconUrl,
      'nightConditionText': nightConditionText,
      'nightIconUrl': nightIconUrl,
    };
  }
}

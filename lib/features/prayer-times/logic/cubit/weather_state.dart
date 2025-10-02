import '../../data/model/weather_report.dart';

class WeatherState {
  final List<WeatherReport> reports;
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  WeatherState({
    this.reports = const [],
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  WeatherState copyWith({
    List<WeatherReport>? reports,
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return WeatherState(
      reports: reports ?? this.reports,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

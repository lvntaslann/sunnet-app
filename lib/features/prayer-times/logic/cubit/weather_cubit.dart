import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/fetch_time_util.dart';
import '../../data/services/weather_services.dart';
import 'weather_state.dart';
import '../../data/model/weather_report.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherState());

  Future<void> getWeather(double lat, double lon) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final reports = await weatherService.fetchWeather(lat, lon);
      emit(state.copyWith(reports: reports, isLoading: false, isSuccess: true));
      if (reports.isNotEmpty) {
        await FetchTimeUtil.saveWeather(jsonEncode(reports.first.toJson()));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadFromCache() async {
    final cachedData = await FetchTimeUtil.getWeather();
    if (cachedData != null) {
      try {
        final jsonData = jsonDecode(cachedData);
        emit(state.copyWith(
          reports: [WeatherReport.fromJson(jsonData)],
          isLoading: false,
          isSuccess: true,
        ));
      } catch (_) {}
    }
  }
}

import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/fetch_time_util.dart';
import '../../data/services/prayer_time_services.dart';
import 'prayer_time_state.dart';
import '../../data/model/prayer_time_model.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  final PrayerTimeService service;

  PrayerTimeCubit(this.service) : super(PrayerTimeState());

  Future<void> getPrayerTimes({
    required double lat,
    required double lng,
    required String date,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final result = await service.fetchPrayerTimes(
        lat: lat,
        lng: lng,
        date: date,
      );
      emit(state.copyWith(data: result, isLoading: false, isSuccess: true));
      await FetchTimeUtil.savePrayerTimes(jsonEncode(result.toJson()));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadFromCache() async {
    final cachedData = await FetchTimeUtil.getPrayerTimes();
    if (cachedData != null) {
      try {
        final jsonData = jsonDecode(cachedData);
        emit(state.copyWith(
          data: PrayerTimesResponse.fromJson(jsonData),
          isLoading: false,
          isSuccess: true,
        ));
      } catch (_) {}
    }
  }
}

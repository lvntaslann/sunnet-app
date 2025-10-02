import '../../data/model/prayer_time_model.dart';

class PrayerTimeState {
  final PrayerTimesResponse? data;
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  PrayerTimeState({
    this.data,
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  PrayerTimeState copyWith({
    PrayerTimesResponse? data,
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return PrayerTimeState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

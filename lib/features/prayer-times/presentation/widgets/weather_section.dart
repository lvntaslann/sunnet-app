import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';
import '../../data/model/weather_report.dart';
import '../../logic/cubit/weather_cubit.dart';
import '../../logic/cubit/weather_state.dart';

class WeatherSection extends StatelessWidget {
  final AppColors appColors;
  const WeatherSection({super.key, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        } else if (state.reports.isNotEmpty) {
          WeatherReport today = state.reports.first;
          return Column(
            children: [
              Text(
                "Hava durumu",
                style: TextStyle(
                  color: appColors.prayerPage.titleTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSizes.s18,
                ),
              ),
              SizedBox(height: 7.h),
              Image.network(today.dayIconUrl, width: 50.w, height: 50.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${today.maxTemp.round()}° ",
                      style: TextStyle(
                        color: appColors.prayerPage.currentDayTimeTextColor,
                        fontSize: AppFontSizes.s16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "${today.minTemp.round()}°",
                      style: TextStyle(
                        color: appColors.prayerPage.currentNightTimeTextColor,
                        fontSize: AppFontSizes.s16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(today.dayConditionText),
            ],
          );
        } else if (state.error != null) {
          return Text("Hata: ${state.error}");
        } else {
          return const Text("Hava durumu verisi bulunamadı");
        }
      },
    );
  }
}
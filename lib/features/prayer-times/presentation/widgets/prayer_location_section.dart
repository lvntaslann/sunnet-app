import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';
import '../../data/model/prayer_time_model.dart';
import '../../logic/cubit/prayer_time_cubit.dart';
import '../../logic/cubit/prayer_time_state.dart';

class PrayerLocationSection extends StatelessWidget {
  final AppColors appColors;
  const PrayerLocationSection({super.key, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            } else if (state.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.data!.place.name,
                    style: TextStyle(
                      color: appColors.prayerPage.titleTextColor,
                      fontSize: AppFontSizes.s22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
                    builder: (context, state) {
                      if (state.data != null && state.data!.days.isNotEmpty) {
                        PrayerDay today = state.data!.days.first;
                        return Text(
                          "${today.getUpcomingPrayer()} namazı",
                          style: TextStyle(
                            color: appColors.prayerPage.topTimeTextColor,
                            fontSize: AppFontSizes.s16,
                          ),
                        );
                      } else {
                        return const Text(
                          "Namaz vakti yok",
                          style: TextStyle(fontSize: 16),
                        );
                      }
                    },
                  ),
                ],
              );
            } else {
              return const Text("Veri yok");
            }
          },
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: appColors.prayerPage.titleTextColor,
            ),
            SizedBox(width: 5.w),
            Text(
              "En yakın camii\nkonumu",
              style: TextStyle(
                color: appColors.prayerPage.titleTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

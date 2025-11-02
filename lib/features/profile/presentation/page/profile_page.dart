import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunnet_app/core/themes/app_colors.dart';
import '../../../auth/logic/cubit/user_cubit.dart';
import '../widgets/daily_goal_section.dart';
import '../widgets/profile_header.dart';
import '../widgets/task_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    final user = context.read<UserCubit>().state.user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 12.h),
        ProfileHeader(appColors: appColors, user: user!),
        SizedBox(height: 25.h),
        DailyGoalSection(appColors: appColors, progress: 0.5),
        SizedBox(height: 20.h),
        TaskSection(appColors: appColors),
      ],
    );
  }
}
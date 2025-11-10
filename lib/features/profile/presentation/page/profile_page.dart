import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunnet_app/core/themes/app_colors.dart';
import '../../../auth/logic/cubit/user_cubit.dart';
import '../../../user_duties/logic/cubit/user_duty_cubit.dart';
import '../../../user_duties/presentation/widgets/user_duties_section.dart';
import '../widgets/daily_goal_section.dart';
import '../widgets/profile_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserDutyCubit>().loadUserDuties();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    final user = context.read<UserCubit>().state.user;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          ProfileHeader(appColors: appColors, user: user!),
          SizedBox(height: 25.h),
          DailyGoalSection(appColors: appColors, progress: 0.5),
          SizedBox(height: 20.h),
          UserDutiesSection(appColors: appColors),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
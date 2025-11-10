import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../channels/logic/cubit/duty_cubit.dart';
import '../../logic/cubit/user_duty_cubit.dart';
import '../../logic/cubit/user_duty_state.dart';
import 'user_duty_card.dart';

class UserDutiesSection extends StatelessWidget {
  final AppColors appColors;

  const UserDutiesSection({Key? key, required this.appColors}) : super(key: key);

  Future<void> _toggleDutyStatus(
    BuildContext context,
    String channelId,
    String dutyId,
    String currentStatus,
  ) async {
    final newStatus = currentStatus == 'done' ? 'pending' : 'done';
    
    try {
      // Kullanıcı ID'sini cubit'ten al
      final userId = context.read<UserDutyCubit>().currentUserId;
      if (userId == null) {
        throw Exception('Kullanıcı girişi yapılmamış');
      }

      await context.read<DutyCubit>().updateDutyStatus(
        channelId: channelId,
        memberId: userId,
        dutyId: dutyId,
        newStatus: newStatus,
      );
      
      await context.read<UserDutyCubit>().refreshSilently();
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Görev ${newStatus == 'done' ? 'tamamlandı' : 'beklemede'} olarak işaretlendi'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Hata: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDutyCubit, UserDutyState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(
            child: Text(
              'Hata: ${state.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state.duties.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                'Henüz görev atanmadı',
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Görevlerim',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: state.duties.length,
              itemBuilder: (context, index) {
                final duty = state.duties[index];
                return UserDutyCard(
                  duty: duty,
                  appColors: appColors,
                  onToggleStatus: (dutyId, currentStatus) => _toggleDutyStatus(
                    context,
                    duty.channelId,
                    dutyId,
                    currentStatus,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../data/model/members_model.dart';
import '../../../data/model/duty_model.dart';
import '../../../logic/cubit/duty_cubit.dart';
import '../showdialog/add_duty_dialog.dart';

class AddDutyFloatingButton extends StatelessWidget {
  final List<MembersModel> members;
  final AppColors appColors;
  final String channelId;
  final VoidCallback onDutyAdded;

  const AddDutyFloatingButton({
    Key? key,
    required this.members,
    required this.appColors,
    required this.channelId,
    required this.onDutyAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: appColors.channelsPage.buttonBgColor,
      onPressed: () async {
        final result = await showDialog<Map<String, dynamic>>(
          context: context,
          builder: (context) => AddDutyDialog(
            members: members,
            appColors: appColors,
          ),
        );

        if (result == null) return;

        final duty = DutyModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: result['name'] as String,
          tasks: result['tasks'] as List<String>,
          assignedTo: result['assignedTo'] as String,
          createdBy: FirebaseAuth.instance.currentUser?.uid ?? '',
          status: 'pending',
          createdAt: DateTime.now(),
        );

        await context.read<DutyCubit>().saveDuty(
          duty,
          channelId,
        );
        onDutyAdded();
      },
      child: Icon(
        Icons.add,
        color: appColors.channelsPage.addButtonIconColor,
      ),
    );
  }
}

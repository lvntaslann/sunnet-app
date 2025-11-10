import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../data/model/channel_model.dart';
import '../../../logic/cubit/channel_cubit.dart';
import 'discoverable_channel_card.dart';

class DiscoverableChannelsList extends StatelessWidget {
  final bool isLoading;
  final List<ChannelModel> channels;
  final Set<String> joiningChannels;
  final AppColors appColors;
  final Function(String channelId) onJoinStart;
  final Function(String channelId) onJoinSuccess;
  final Function(String channelId) onJoinError;

  const DiscoverableChannelsList({
    Key? key,
    required this.isLoading,
    required this.channels,
    required this.joiningChannels,
    required this.appColors,
    required this.onJoinStart,
    required this.onJoinSuccess,
    required this.onJoinError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (channels.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: const Center(
          child: Text(
            "Keşfedilecek kanal yok",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: channels.length,
      itemBuilder: (context, index) {
        final channel = channels[index];
        final isJoining = joiningChannels.contains(channel.id);
        
        return DiscoverableChannelCard(
          title: channel.title,
          subTitle: channel.subTitle,
          memberCount: channel.members.length,
          appColors: appColors,
          isJoining: isJoining,
          onJoinTap: isJoining ? null : () async {
            onJoinStart(channel.id);
            
            try {
              debugPrint("Joining channel: ${channel.id}");
              await context.read<ChannelCubit>().joinChannel(channel.id);
              onJoinSuccess(channel.id);
              context.read<ChannelCubit>().refreshJoinedChannelsSilently();
            } catch (e) {
              debugPrint("Join error: $e");
              onJoinError(channel.id);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Katılma hatası: $e')),
                );
              }
            }
          },
        );
      },
    );
  }
}

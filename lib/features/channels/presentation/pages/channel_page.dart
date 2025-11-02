import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunnet_app/core/routes/app_routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/button/channel_default_button.dart';
import '../widgets/channel/content_container.dart';
import '../widgets/button/switch_Item_button_left.dart';
import '../widgets/button/switch_item_button_right.dart';


class ChannelPage extends StatefulWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  bool isSwitched = false;
  void toggleSwitch() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: appColors.channelsPage.pageBgColor,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchItemButtonLeft(
                title: "Kanallarım",
                appColors: appColors,
                isActive: isSwitched,
                onTap: () {
                  toggleSwitch();
                },
              ),
              SwitchItemButtonRight(
                title: "Keşfet",
                appColors: appColors,
                isActive: !isSwitched,
                onTap: () {
                  toggleSwitch();
                },
              ),
            ],
          ),
          SizedBox(height: 15.h),
          ContentContainer(
            appColors: appColors,
            title: "İslami düşünceler",
            subTitle: "12 üye",
            onTap: () {
              Navigator.pushNamed(context, Routes.duty);
            },
          ),
          SizedBox(height: 15.h),
          ContentContainer(
            appColors: appColors,
            title: "Kur'an çalışmaları",
            subTitle: "7 üye",
            onTap: () {
              Navigator.pushNamed(context, Routes.duty);
            },
          ),
          SizedBox(height: 15.h),
          ContentContainer(
            appColors: appColors,
            title: "Günlük dualar",
            subTitle: "5 üye",
            onTap: () {
              Navigator.pushNamed(context, Routes.duty);
            },
          ),
          SizedBox(height: 100.h),
          Center(
            child: ChannelDefaultButton(
              appColors: appColors,
              title: "Yeni Kanal Oluştur",
            ),
          ),
        ],
      ),
    );
  }
}

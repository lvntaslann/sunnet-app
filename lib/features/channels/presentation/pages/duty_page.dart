import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunnet_app/core/widgets/custom_app_bar.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/button/channel_default_button.dart';
import '../widgets/duty/student_detail.dart';
import '../widgets/button/switch_Item_button_left.dart';
import '../widgets/button/switch_item_button_right.dart';

class DutyPage extends StatefulWidget {
  const DutyPage({Key? key}) : super(key: key);

  @override
  _DutyPageState createState() => _DutyPageState();
}

class _DutyPageState extends State<DutyPage> {
  bool isSwitched = true;
  bool onTapDutyButton = false;
  int? expandedIndex;

  List<String> duties = [
    "İslami düşüncelerle ilgili makale oku",
    "Sahi hadisleri araştır",
  ];

  List<String> members = ["Levent ASLAN", "Ahmet YILMAZ", "Mehmet DEMİR"];
  List<String> joinedDetails = [
    "29 Ekim 1923'ten beri üye",
    "15 Temmuz 2016'dan beri üye",
    "23 Nisan 1920'den beri üye",
  ];
  void toggleSwitch() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  void toggleDutyButton(int index) {
    setState(() {
      if (expandedIndex == index) {
        expandedIndex = null;
      } else {
        expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: appColors.channelsPage.pageBgColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(title: "İslami Düşünceler", showBackButton: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),
                SwitchItemButtonLeft(
                  appColors: appColors,
                  title: "Üyeler",
                  isActive: isSwitched,
                  onTap: () {
                    toggleSwitch();
                  },
                ),
                SwitchItemButtonRight(
                  title: "Görevler",
                  appColors: appColors,
                  isActive: !isSwitched,
                  onTap: () {
                    toggleSwitch();
                  },
                ),
              ],
            ),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: members.length,
              itemBuilder: (context, index) {
                return StudentDetail(
                  appColors: appColors,
                  name: members[index],
                  joinDate: joinedDetails[index],
                  completedDuties: 2,
                  isUserOrDuty: isSwitched,
                  onTapDutyButton: () => toggleDutyButton(index),
                  duties: duties,
                  isTappedButton: expandedIndex == index,
                );
              },
            ),
            SizedBox(height: 100.h),
            Center(
              child: ChannelDefaultButton(
                appColors: appColors,
                title: "Kanalı Kapat",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

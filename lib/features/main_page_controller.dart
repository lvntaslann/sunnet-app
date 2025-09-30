import 'package:flutter/material.dart';
import 'package:sunnet_app/core/themes/app_colors.dart';
import 'package:sunnet_app/core/widgets/custom_app_bar.dart';
import 'package:sunnet_app/features/hadis/presentation/page/hadis_page.dart';
import 'package:sunnet_app/features/home/presentation/page/home_page.dart';

import '../core/widgets/custom_bottom_nav_bar.dart';

class MainPageController extends StatefulWidget {
  const MainPageController({Key? key}) : super(key: key);

  @override
  _MainPageControllerState createState() => _MainPageControllerState();
}

class _MainPageControllerState extends State<MainPageController> {
  int currentIndex = 0;

  List<Widget> getPages() {
    return [
      const HomePage(),
      const HadisPage(),
      const HomePage(),
      const HomePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return Scaffold(
      appBar: CustomAppBar(title: "Anasayfa", showBackButton: false),
      backgroundColor: appColors.home.pageBgColor,
      body: Column(
        children: [
          Expanded(
            child: getPages()[currentIndex],
          ),
          CustomBottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
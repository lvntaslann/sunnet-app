import 'package:flutter/material.dart';
import 'package:sunnet_app/core/constants/mini_container_detail.dart';
import 'package:sunnet_app/features/home/presentation/widgets/mini_container_item.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/routes/app_routes.dart';


class MiniContainerRow extends StatelessWidget {
  const MiniContainerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: miniContainerContent.map((item) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.namaz),
          child: MiniContainerItem(item: item, appColors: appColors),
        );
      }).toList(),
    );
  }
}

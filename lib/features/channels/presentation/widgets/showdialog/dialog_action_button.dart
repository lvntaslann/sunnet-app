import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';

class DialogActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final AppColors appColors;

  const DialogActionButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.appColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          color: appColors.channelsPage.addButtonIconBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: appColors.channelsPage.addButtonIconColor),
          ),
        ),
      ),
    );
  }
}

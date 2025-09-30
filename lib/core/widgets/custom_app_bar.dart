import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final bool showBackButton;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = const Color(0xFF152A1E),
    required this.showBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              tooltip: 'Geri',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : SizedBox(),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      backgroundColor: backgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.r),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.white70),
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}

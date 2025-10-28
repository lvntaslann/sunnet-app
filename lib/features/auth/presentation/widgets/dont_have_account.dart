import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';
import '../pages/signup_page.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    required this.appColors,
  });

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:  (_) => const SignupPage()));
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hesabın yok mu? ",
                style: TextStyle(
                  color: appColors.authPage.textColor,
                  fontSize: AppFontSizes.s14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Kayıt Ol",
                style: TextStyle(
                  color: appColors.authPage.dontHaveAccountTextColor,
                  fontSize: AppFontSizes.s14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
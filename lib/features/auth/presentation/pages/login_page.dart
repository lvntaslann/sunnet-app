import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunnet_app/features/auth/presentation/widgets/dont_have_account.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/title_text.dart';
import '../../../auth/logic/cubit/user_cubit.dart';
import '../../../auth/logic/cubit/user_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state.isAuthenticated) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Giriş başarılı!")));
          Navigator.pushReplacementNamed(context, Routes.main);
        } else if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
      },
      child: Scaffold(
        backgroundColor: appColors.authPage.pageBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Center(child: Image.asset("assets/auth/authpage-icon.png")),
              SizedBox(height: 20),
              TitleText(appColors: appColors, titleText: "E-mail"),
              SizedBox(height: 5),
              AuthTextfield(
                appColors: appColors,
                hintText: "Ex: example@gmail.com",
                controller: emailController,
                isPassword: false,
              ),
              SizedBox(height: 20),
              TitleText(appColors: appColors, titleText: "Şifre"),
              SizedBox(height: 5),
              AuthTextfield(
                appColors: appColors,
                hintText: "Ex: !dkKOWsŞ548.Ç54",
                controller: passwordController,
                isPassword: true,
              ),
              SizedBox(height: 70),
              AuthButton(
                appColors: appColors,
                buttonText: "Giriş Yap",
                onTap: () {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Lütfen tüm alanları doldurun."),
                      ),
                    );
                    return;
                  }

                  context.read<UserCubit>().signIn(email, password);
                },
              ),
              SizedBox(height: 30),
              DontHaveAccount(appColors: appColors),
            ],
          ),
        ),
      ),
    );
  }
}

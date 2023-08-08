import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/logic/app_cubit.dart';
import 'package:iti_final_project/views/home/home_layout.dart';
import 'package:iti_final_project/views/on_boarding_page.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static String id = 'SplashPage';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppCubit.get(context).loadState(),
      builder: (context,snapshot) {
        return AnimatedSplashScreen(
          splash: Image.asset('assets/logo.png'),
          splashIconSize: MediaQuery.of(context).size.width / 2,
          duration: 1500,
          nextScreen: !AppCubit.get(context).openedBefore
              ? const OnBoardingPage()
              : AppCubit.get(context).loggedIn
                  ? const HomeLayout()
                  : LoginPage(),
        );
      }
    );
  }
}

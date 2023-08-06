import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/views/home/home_layout.dart';
import 'package:iti_final_project/views/on_boarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String id = 'SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loggedIn = false;
  bool openedBefore = false;
  @override
  void initState() {
    super.initState();
    loadState();
  }

  void loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedIn = (prefs.getBool('isLoggedIn') ?? false);
      openedBefore = (prefs.getBool('isOpenedBefore') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/logo.png'),
      splashIconSize: MediaQuery.of(context).size.width / 2,
      duration: 1500,
      nextScreen: !openedBefore
          ? const OnBoardingPage()
          : loggedIn
              ? const HomeLayout()
              : LoginPage(),
    );
  }
}

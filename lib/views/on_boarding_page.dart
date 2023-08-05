import 'package:flutter/material.dart';
import 'package:iti_final_project/views/home/home_layout.dart';
import 'package:iti_final_project/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  static String id = 'On Boarding Page';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool isLoggedin = false;

  void isLoggedInState() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedin = prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  void initState() {
    super.initState();
    isLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 300,
            ),
            const Text('Welcome to our application'),
            InkWell(
              onTap: () {
                isLoggedin
                    ? Navigator.pushReplacementNamed(context, HomeLayout.id)
                    : Navigator.pushReplacementNamed(context, LoginPage.id);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF042f67),
                ),
                child: const Icon(
                  Icons.arrow_right,
                  color: Color(0xFFFFFFFF),
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

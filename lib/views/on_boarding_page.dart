import 'package:flutter/material.dart';
import 'package:iti_final_project/logic/app_cubit.dart';
import 'widgets/onboarding_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  static String id = 'On Boarding Page';

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
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Welcome to ITI E-Commerce App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Sign in to save your favourites\nSearch by categories\nShop what you want ,anytime',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                AppCubit.get(context).skipOnBoarding(context);
              },
              child: const OnBoardingButton(),
            )
          ],
        ),
      ),
    );
  }
}

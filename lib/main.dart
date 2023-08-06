import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/logic/app_cubit.dart';
import 'package:iti_final_project/logic/login_register_cubit.dart';
import 'package:iti_final_project/views/home/home_layout.dart';
import 'package:iti_final_project/views/login_page.dart';
import 'package:iti_final_project/views/on_boarding_page.dart';
import 'package:iti_final_project/views/register_page.dart';
import 'package:iti_final_project/views/splash_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginRegisterCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ITI E-Commerce App',
        routes: {
          OnBoardingPage.id: (context) => const OnBoardingPage(),
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          HomeLayout.id: (context) => const HomeLayout(),
          SplashPage.id: (context) => const SplashPage()
        },
        initialRoute: SplashPage.id,
      ),
    );
  }
}

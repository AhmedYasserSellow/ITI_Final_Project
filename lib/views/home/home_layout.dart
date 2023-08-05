import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/logic/app_cubit.dart';
import 'package:iti_final_project/logic/app_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  static String id = 'Home Layout';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ITI E-Commerce App'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: 'Categories'),
            ]),
      );
    });
  }
}

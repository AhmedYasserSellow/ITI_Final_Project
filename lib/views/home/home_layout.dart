import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/logic/app_cubit.dart';
import 'package:iti_final_project/logic/app_states.dart';
import 'package:iti_final_project/views/home/categories_page.dart';
import 'package:iti_final_project/views/home/home_page.dart';
import 'package:iti_final_project/views/home/profile_page.dart';

List<Widget> pages = [
  const ProfilePage(),
  const HomePage(),
  const CatogriesPage()
];

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  static String id = 'Home Layout';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(61, 106, 214, 1),
          title: const Text('ITI E-Commerce App'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {},
                  value: 1,
                  child: const Text("About Application"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  value: 2,
                  child: const Text("About Developers"),
                ),
              ],
              color: Colors.white,
              elevation: 2,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromRGBO(61, 106, 214, 1),
          currentIndex: AppCubit.get(context).bottomNavBarIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
            ),
          ],
          onTap: (index) {
            AppCubit.get(context).changeBottomNavIndex(index);
          },
        ),
        body: pages[AppCubit.get(context).bottomNavBarIndex],
      );
    });
  }
}

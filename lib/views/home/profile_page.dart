import 'package:flutter/material.dart';
import 'package:iti_final_project/views/widgets/button.dart';
import 'package:iti_final_project/views/widgets/list_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name, email;
  Future<Map<String, String>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('Name');
    email = prefs.getString('Email');
    return <String, String>{
      'name': name!,
      'email': email!,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/user.png',
                      width: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customListTile(
                      label: snapshot.data!['name']!,
                      icon: Icons.account_circle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customListTile(
                      label: snapshot.data!['email']!,
                      icon: Icons.email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customListTile(
                      label: '01XXXXXXXXX',
                      icon: Icons.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customListTile(
                      label: 'Egypt , Dakahalia , Mansoura',
                      icon: Icons.location_on,
                    ),
                    const Expanded(child: SizedBox()),
                    customButton(
                      width: 200,
                      onTap: () {},
                      text: 'Log Out',
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

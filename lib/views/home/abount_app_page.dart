import 'package:flutter/material.dart';
import 'package:iti_final_project/views/widgets/links_button.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'About',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            subtitleTextStyle: const TextStyle(fontSize: 18),
            isThreeLine: true,
            tileColor: Colors.white,
            leading: Image.asset('assets/logo.png'),
            title: const Text(
              'ITI E-Commerce App',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('FREE'),
                Text('1.0.0'),
                Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'rate and review',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'send feedback',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'share app',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'privacy policy',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Connections',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const LinkButton(
            image: 'facebook_white.png',
            color: Color.fromRGBO(61, 106, 214, 1),
          ),
          const LinkButton(
            image: 'x.png',
            color: Color.fromRGBO(29, 155, 240, 1),
          ),
          const LinkButton(
            image: 'instagram.png',
            color: Color.fromRGBO(115, 36, 193, 1),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(115, 36, 193, 1),
              Color.fromRGBO(196, 42, 103, 1),
              Color.fromRGBO(220, 141, 64, 1),
            ]),
          ),
          const LinkButton(
            image: 'whatsapp.png',
            color: Color.fromRGBO(70, 198, 85, 1),
          ),
          const LinkButton(
            image: 'github.png',
            color: Color.fromRGBO(1, 4, 9, 1),
            imageColor: Colors.white,
          ),
        ],
      ),
    ));
  }
}

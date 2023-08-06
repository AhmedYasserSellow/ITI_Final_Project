import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget aboutDev({
  required String img,
  required String name,
  required String whatsappUrl,
  required String githubUrl,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
    child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: const Color.fromRGBO(61, 106, 214, 1),
        textColor: Colors.white,
        leading: Image.asset(
          img,
          width: 75,
          height: 75,
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                launchUrlString(whatsappUrl);
              },
              icon: Image.asset('assets/whatsapp.png'),
            ),
            IconButton(
              onPressed: () {
                launchUrlString(githubUrl);
              },
              icon: Image.asset(
                'assets/github.png',
                color: Colors.white,
              ),
            ),
          ],
        )),
  );
}

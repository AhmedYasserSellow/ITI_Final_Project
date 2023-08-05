import 'package:flutter/material.dart';

Widget customListTile({required String label, required IconData icon}) {
  return ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    iconColor: Colors.white,
    leading: Icon(
      icon,
      size: 32,
    ),
    textColor: Colors.white,
    tileColor: Colors.blue,
    title: Text(
      label,
      style: const TextStyle(fontSize: 18),
    ),
  );
}

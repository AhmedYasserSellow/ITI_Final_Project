import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.image,
    required this.color,
    this.gradient,
    this.imageColor,
  });
  final Color? imageColor;
  final Color color;
  final String image;
  final String text = 'ITI E-Commerce';

  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: gradient,
        color: color,
      ),
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/$image',
              height: 24,
              width: 24,
              color: imageColor,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

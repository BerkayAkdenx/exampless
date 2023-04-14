import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {
  final String imagePath;
  Function() function;
  SquareTitle({super.key, required this.imagePath, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xfff2f1fc),
        ),
        child: Image.asset(
          imagePath,
          height: 20,
        ),
      ),
    );
  }
}

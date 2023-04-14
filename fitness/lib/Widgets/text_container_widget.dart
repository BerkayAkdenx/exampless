import 'package:flutter/material.dart';

class TextContainerWidget extends StatelessWidget {
  const TextContainerWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
        ),
        height: 59.66,
        width: 366,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(
                color: Color(0xff0A0A0A),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

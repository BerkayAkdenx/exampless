import 'package:flutter/material.dart';

class SpaceContainerWidget extends StatelessWidget {
  const SpaceContainerWidget({
    super.key,
    required this.day,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
      ),
      height: 59.66,
      width: 366,
      alignment: Alignment.centerLeft,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "",
          style: TextStyle(
              color: Color(0xff0A0A0A),
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

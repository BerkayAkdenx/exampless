import 'package:fitness/views/workouts_view.dart';
import 'package:flutter/material.dart';

class DaysContainerWidget extends StatelessWidget {
  const DaysContainerWidget({
    super.key,
    required this.day,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WorkoutsView(),
          )),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          color: const Color(0xffb4b6bc),
        ),
        height: 59.66,
        width: 366,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            day,
            style: const TextStyle(
                color: Color(0xff0A0A0A),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

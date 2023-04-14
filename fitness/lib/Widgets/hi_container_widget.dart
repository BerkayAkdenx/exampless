import 'package:flutter/material.dart';

class HiContainerWidget extends StatelessWidget {
  const HiContainerWidget({
    super.key,
    required this.title,
    required this.desciption,
  });

  final String title;
  final String desciption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
      ),
      height: 59.66,
      width: 366,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xff0A0A0A),
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    desciption,
                    style:
                        const TextStyle(color: Color(0xffA1A1A1), fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

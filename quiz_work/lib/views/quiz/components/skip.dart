import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_work/controllers/question_controller.dart';

class Skip extends StatelessWidget {
  const Skip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: controller.nextQuestion,
          child: const Text(
            "Skip",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

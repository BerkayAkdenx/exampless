import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_work/base-components/base_background.dart';
import 'package:quiz_work/constants.dart';
import 'package:quiz_work/controllers/question_controller.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    double sum =
        (qnController.numIfCorrectAns) * 100 / qnController.questions.length;
    int intSum = sum.ceil();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BaseBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: kSecondaryColor),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                child: Text(
                  "$intSum/100",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: kSecondaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

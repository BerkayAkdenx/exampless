import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_work/base-components/base_background.dart';
import 'package:quiz_work/constants.dart';
import 'package:quiz_work/controllers/question_controller.dart';
import 'package:quiz_work/views/quiz/components/progress_bar.dart';
import 'package:quiz_work/views/quiz/components/question_card.dart';
import 'package:quiz_work/views/quiz/components/skip.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Stack(
      children: [
        const BaseBackground(),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skip(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text.rich(
                  TextSpan(
                    text: "Question 1",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: kSecondaryColor),
                    children: [
                      TextSpan(
                        text: "/10",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: kSecondaryColor),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                  child: PageView.builder(
                itemCount: questionController.questions.length,
                itemBuilder: (context, index) =>
                    QuestionCard(question: questionController.questions[index]),
              ))
            ],
          ),
        )
      ],
    );
  }
}

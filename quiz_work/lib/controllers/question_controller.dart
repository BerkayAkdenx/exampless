import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_work/models/question.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ignore: unused_field
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;
  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question["question"],
          options: question["options"],
          answer: question['answer_index'],
        ),
      )
      .toList();
  List<Question> get questions => _questions;
  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit

    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
    super.onInit();
  }
}

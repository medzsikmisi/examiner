import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:sophib/constants/routes.dart';
import 'package:sophib/services/exam_manager.dart';

import '../../models/question.dart';

class QuestionController extends GetxController {
  Random random = Random();
  Rxn<Question> currentQuestion = Rxn();
  RxBool isLastQuestion = false.obs;
  RxInt timer = RxInt(0);
  bool _countdownRequired = true;

  @override
  void onInit() {
    nextQuestion(updateTime: false);
    countdown();
    super.onInit();
  }

  void nextQuestion({bool updateTime = true}) {
    if (updateTime) {
      ExamManager.updateRemainingTime(currentQuestion.value!, timer.value);
    }
    final nextQuestionn = ExamManager.instance.getNextQuestion();
    if (currentQuestion.value == nextQuestionn && isLastQuestion.isFalse) {
      nextQuestion(updateTime: false);
      return;
    }
    setValues(nextQuestionn!);
  }

  setValues(Question nextQuestionn) {
    nextQuestionn.options.shuffle();
    currentQuestion.value = nextQuestionn;
    timer.value = nextQuestionn.remainingTime;
    isLastQuestion.value = !ExamManager.instance.isAnyRemainingQuestion();
  }

  void solve() {
    ExamManager.solveQuestion(currentQuestion.value!);
    if (isLastQuestion.isTrue) {
      _countdownRequired = false;
      Get.toNamed(rResult);
      return;
    }
    nextQuestion();
  }

  void selectOption(String? choice) {
    ExamManager.setChoice(currentQuestion.value!, choice);
    currentQuestion.update((val) {
      val?.choice = choice;
    });
  }

  void countdown() {
    Future.doWhile(
        () async => await Future.delayed(const Duration(seconds: 1), () {
              timer -= 1;
              if (timer.value <= 0 && _countdownRequired) solve();
              return _countdownRequired;
            }));
  }
}

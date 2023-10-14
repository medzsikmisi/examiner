import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophib/models/question.dart';
import 'package:sophib/services/exam_manager.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(
                  ExamManager.exam.title,
                  style: Get.textTheme.headlineLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(
                  '${ExamManager.correctQuestions}/${ExamManager.numberOfQuestions}',
                  style: Get.textTheme.headlineSmall,
                ),
              ),
              SizedBox(width: 800,
                child: ListView(shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(ExamManager.numberOfQuestions,
                      (i) => getQuestionWidget(ExamManager.questions[i])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getQuestionWidget(Question question) {
    return Card(
      color: question.correct ? Colors.lightGreen : Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SelectableText(
              'Kérdés: ${question.question}',
              style: Get.textTheme.titleMedium,
            ),
            SelectableText('Helyes válasz: ${question.answer}'),
            SelectableText('Válasz: ${question.choice ?? 'Nem megválaszolt'}')
          ],
        ),
      ),
    );
  }
}

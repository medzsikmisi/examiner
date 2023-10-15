import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:sophib/models/exam.dart';
import 'package:sophib/models/question.dart';

class ExamManager {
  ExamManager._privateConstructor();

  static final ExamManager _instance = ExamManager._privateConstructor();

  static ExamManager get instance => _instance;

  String? currentExamPath = '';

  Exam? _exam;

  static Exam get exam => instance._exam!;

  static int get numberOfQuestions => exam.questions.length;

  static int get time =>
      exam.questions.map((e) => e.remainingTime).fold(0, (p, e) => p + e);

  static List<Question> get questions => _instance._exam!.questions;

  static int get correctQuestions =>
      exam.questions.where((e) => e.correct).length;

  static bool get anyError => exam.questions.any((q) => q.solvable == false);

  static setChoice(Question question, String? choice) {
    Get.log('Updating ${question.question}');
    if (question.choice == choice) return;
    final index = _instance._exam!.questions.indexOf(question);
    _instance._exam!.questions[index].choice = choice;
    Get.log('$choice set for #$index');
  }

  static updateRemainingTime(Question question, int seconds) {
    final index = _instance._exam!.questions.indexOf(question);
    _instance._exam!.questions[index].remainingTime = seconds;
  }

  bool isAnyRemainingQuestion() {
    return exam.questions.where((e) => !e.solved).length > 1;
  }

  static void solveQuestion(Question question) {
    final index = _instance._exam!.questions.indexOf(question);
    Get.log('Solving $index, final choice: ${question.choice}');
    _instance._exam!.questions[index].solved = true;
  }

  Question? getNextQuestion() {
    final questions = exam.questions;
    final remaining = questions.where((e) => e.remainingTime == 60);
    if (remaining.isNotEmpty) {
      return remaining.elementAt(Random().nextInt(remaining.length));
    }
    final toBeContinued = questions.where((e) => e.solved == false);
    if (toBeContinued.isNotEmpty) {
      return toBeContinued.elementAt(Random().nextInt(toBeContinued.length));
    }
    return null;
  }

  Future<void> loadExams() async {
    final input = File(currentExamPath!).openRead();
    final loadedData = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter(fieldDelimiter: '\t'))
        .toList();
    Get.log('Current path: $currentExamPath');
    final title = loadedData.first.first.toString();
    final questions = <Question>[];
    for (final row in loadedData.sublist(2)) {
      final question = Question(row.first.toString(),
          row.sublist(1).map((e) => e.toString()).toList());
      questions.add(question);
    }
    Get.log('Number of questions: ${questions.length}');
    _exam = Exam(title);
    _exam!.questions.addAll(questions);
  }
}

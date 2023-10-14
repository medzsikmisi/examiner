class Question {
  Question(this.question, this.options) : answer = options.first;

  String question;
  String answer;
  String? choice;
  List<String> options;
  int remainingTime = 5;
  bool solved = false;

  bool get solvable => options.length >= 2;

  bool get correct => choice == answer;
}

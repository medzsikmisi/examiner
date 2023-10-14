import 'package:get/get.dart';
import 'package:sophib/constants/routes.dart';

import 'question_controller.dart';
import 'question_page.dart';

class GetQuestionPage extends GetPage {
  GetQuestionPage()
      : super(
          name: rQuestion,
          page: () => QuestionPage(),
          binding: QuestionBinding(),
        );
}

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController());
  }
}

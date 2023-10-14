import 'package:get/get.dart';
import 'package:sophib/constants/routes.dart';
import 'package:sophib/routes/result/result_page.dart';
import 'result_controller.dart';

class GetResultPage extends GetPage {
  GetResultPage()
      : super(
          name: rResult,
          page: () => const ResultPage(),
          binding: ResultBinding(),
        );
}

class ResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultController());
  }
}

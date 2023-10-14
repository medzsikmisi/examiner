import 'package:get/get.dart';
import 'package:sophib/constants/routes.dart';
import 'package:sophib/routes/overview/overview_controller.dart';
import 'package:sophib/routes/overview/overview_page.dart';

class GetOverviewPage extends GetPage {
  GetOverviewPage()
      : super(
          name: rOverview,
          page: () => const OverviewPage(),
          binding: OverviewBinding(),
        );
}

class OverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OverviewController());
  }
}

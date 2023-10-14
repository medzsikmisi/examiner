import 'package:get/get.dart';
import 'package:sophib/constants/routes.dart';
import 'package:sophib/routes/home/home_controller.dart';
import 'package:sophib/routes/home/home_page.dart';

class GetHomePage extends GetPage {
  GetHomePage()
      : super(
          name: rHome,
          page: () => HomePage(),
          binding: HomePageBinding(),
        );
}

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

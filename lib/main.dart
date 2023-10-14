import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophib/routes/home/home_get_page.dart';
import 'package:sophib/routes/overview/overview_get_page.dart';
import 'package:sophib/routes/result/result_get_page.dart';

import 'routes/question/question_get_page.dart';

void main() {
  runApp(const SophiB());
}

class SophiB extends StatelessWidget {
  const SophiB({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetHomePage(),
        GetOverviewPage(),
        GetQuestionPage(),
        GetResultPage(),
      ],
    );
  }
}

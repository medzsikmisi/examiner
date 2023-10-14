import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophib/services/exam_manager.dart';

import '../../constants/routes.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ExamManager.exam.title,
              style: Get.textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Kérdések száma: ${ExamManager.numberOfQuestions}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Rendelkezésre álló idő: ${ExamManager.time}s (60s/kérdés)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: ()=>Get.toNamed(rQuestion), icon: const Icon(FluentIcons.play_12_regular)),
          )
        ],
      )),
    );
  }
}

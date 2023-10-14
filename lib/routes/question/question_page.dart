import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophib/routes/question/question_controller.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({super.key});

  final QuestionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText(
                      controller.currentQuestion.value!.question,
                      style: Get.textTheme.headlineSmall
                          ?.copyWith(color: Colors.blueAccent),
                    ),
                  ),
                  ...List.generate(
                      controller.currentQuestion.value!.options.length,
                      (i) => getOptionWidget(
                          controller.currentQuestion.value!.options[i],
                          controller.currentQuestion.value!.choice ==
                              controller.currentQuestion.value!.options[i]))
                ],
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: controller.solve,
                      child: const Wrap(
                        children: [
                          Icon(Icons.check),
                          Text('Válasz érvényesítése')
                        ],
                      )),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.isLastQuestion.isFalse,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: controller.nextQuestion,
                          child: const Wrap(
                            children: [
                              Icon(Icons.pause),
                              Text('Felfüggesztés')
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ),
            Obx(() => Text(controller.timer.toString()))
          ],
        ),
      ),
    );
  }

  getOptionWidget(String option, bool selected) {
    return SizedBox(
      width: 500,
      height: 50,
      child: Card(
        color: selected ? Colors.grey : null,
        semanticContainer: true,
        child: InkWell(
          onTap: () {
            controller.selectOption(option);
          },
          child: Center(child: SelectableText(option)),
        ),
      ),
    );
  }
}

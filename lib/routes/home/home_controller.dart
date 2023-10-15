import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:sophib/constants/routes.dart';
import 'package:sophib/services/downloader.dart';
import 'package:sophib/services/exam_manager.dart';

class HomeController extends GetxController {
  final TextEditingController code = TextEditingController();

  Future<void> onTap() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    if(code.text.trim().isEmpty)onError();
    Option<String> result = await Downloader().downloadExamByCode(code.text);
    result.match(() => onError(), (t) => onSuccess(t));
  }

  onSuccess(_) async {
    ExamManager.instance.currentExamPath = _;
    await ExamManager.instance.loadExams();
    if (ExamManager.anyError) {
      displayError('Hibás vagy sérült feladatsor. Kérj segítséget!');
      return;
    }
    Get.offAllNamed(rOverview);
  }

  onError() {
    displayError('Ellenőrizd a kódot és az internetkapcsolatot...');
  }

  displayError(String error) {
    Get.back();
    Get.defaultDialog(
        title: 'Hiba!',
        content: Text(error),
        textConfirm: 'Rendben',
        onConfirm: () => Get.back());
  }
}

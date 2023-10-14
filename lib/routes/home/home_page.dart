import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sophib/routes/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(width: 300,
              child:  TextField(controller: controller.code,
                decoration: const InputDecoration(hintText: 'Vizsgakód'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: controller.onTap,
                child: const Text('Indítás'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

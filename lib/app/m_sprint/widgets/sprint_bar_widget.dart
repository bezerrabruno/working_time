import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sprint_controller.dart';

class SprintBarWidget extends StatelessWidget {
  final controller = Get.find<SprintController>();

  SprintBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        SizedBox(
          width: 300,
          child: Text(
            'Sprint: 14',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: Text(
            'Initial day: 25',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: Text(
            'Final day: 12',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

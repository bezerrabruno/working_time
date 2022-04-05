import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sprint_controller.dart';

class CardDayWidget extends StatelessWidget {
  final controller = Get.find<SprintController>();

  CardDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.subState) {
        case StatusType.load:
          return const Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: CircularProgressIndicator(),
            ),
          );

        case StatusType.error:
          return const Text(
            'ERROR',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
          );

        case StatusType.success:
          return Container(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Day: ${controller.dayInfo.day}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  prefixText: 'Initial: ',
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                keyboardType: TextInputType.number,
                                initialValue:
                                    controller.dayInfo.iTime.toString(),
                                onChanged: (value) {
                                  controller.dayInfo.iTime =
                                      double.parse(value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  prefixText: 'Final: ',
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                keyboardType: TextInputType.number,
                                initialValue:
                                    controller.dayInfo.fTime.toString(),
                                onChanged: (value) {
                                  controller.dayInfo.fTime =
                                      double.parse(value);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: GestureDetector(
                        onTap: () {
                          controller.saveCard();
                        },
                        child: const Icon(
                          Icons.save_as_outlined,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );

        default:
          return const SizedBox();
      }
    });
  }
}

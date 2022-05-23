import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/list_sprint_controller.dart';
import '../widgets/card_sprint.dart';

class ListSprintPage extends StatefulWidget {
  const ListSprintPage({Key? key}) : super(key: key);

  @override
  State<ListSprintPage> createState() => _ListSprintPageState();
}

class _ListSprintPageState extends State<ListSprintPage> {
  final controller = Get.find<ListSprintController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addSprint(),
      ),
      body: Obx(() {
        switch (controller.state) {
          case StatusType.load:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case StatusType.error:
          case StatusType.success:
            if (controller.sprints.isEmpty) {
              return const Center(
                child: Text(
                  'Adicione uma sprint a lista',
                  style: TextStyle(fontSize: 36),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: controller.sprints.length,
                itemBuilder: (context, item) {
                  return CardSprint(
                    sprint: controller.sprints[item],
                  );
                },
              );
            }

          default:
            return const SizedBox();
        }
      }),
    );
  }
}

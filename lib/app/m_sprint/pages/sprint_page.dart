<<<<<<< Updated upstream:lib/app/m_sprint/pages/sprint_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sprint_controller.dart';
import '../widgets/card_day_widget.dart';
import '../widgets/sprint_bar_widget.dart';

class SprintPage extends StatefulWidget {
  const SprintPage({Key? key}) : super(key: key);

  @override
  State<SprintPage> createState() => _SprintPageState();
}

class _SprintPageState extends State<SprintPage> {
  final controller = Get.find<SprintController>();

  @override
  void initState() {
    controller.initilState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.state) {
          case StatusType.load:
            return const Center(
              child: SizedBox(
                height: 200,
                width: 200,
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
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  SprintBarWidget(),
                  const Divider(
                    color: Colors.white,
                    height: 32,
                  ),
                  Expanded(
                    child: CalendarDatePicker(
                      firstDate: DateTime(2022, 4, 1),
                      lastDate: DateTime(2022, 4, 30),
                      initialDate: controller.currentDate,
                      onDateChanged: (date) => controller.getInfo(date),
                    ),
                  ),
                  Expanded(
                    child: CardDayWidget(),
                  ),
                ],
              ),
            );

          default:
            return const SizedBox();
        }
      }),
    );
  }
}
=======
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controllers/sprint_controller.dart';
// import '../widgets/card_day_widget.dart';
// import '../widgets/sprint_bar_widget.dart';
//
// class SprintPage extends StatefulWidget {
//   const SprintPage({Key? key}) : super(key: key);
//
//   @override
//   State<SprintPage> createState() => _SprintPageState();
// }
//
// class _SprintPageState extends State<SprintPage> {
//   final controller = Get.find<SprintController>();
//
//   @override
//   void initState() {
//     controller.initilState();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         switch (controller.state) {
//           case StatusType.load:
//             return const Center(
//               child: SizedBox(
//                 height: 200,
//                 width: 200,
//                 child: CircularProgressIndicator(),
//               ),
//             );
//
//           case StatusType.error:
//             return const Text(
//               'ERROR',
//               style: TextStyle(
//                 fontSize: 48,
//                 fontWeight: FontWeight.w700,
//               ),
//             );
//
//           case StatusType.success:
//             return Padding(
//               padding: const EdgeInsets.all(32.0),
//               child: Column(
//                 children: [
//                   SprintBarWidget(),
//                   const Divider(
//                     color: Colors.white,
//                     height: 32,
//                   ),
//                   Expanded(
//                     child: CalendarDatePicker(
//                       firstDate: DateTime(2022, 5, 13),
//                       lastDate: DateTime(2022, 6, 02),
//                       initialDate: controller.currentDate,
//                       onDateChanged: (date) => controller.getInfo(date),
//                     ),
//                   ),
//                   Expanded(
//                     child: CardDayWidget(),
//                   ),
//                 ],
//               ),
//             );
//
//           default:
//             return const SizedBox();
//         }
//       }),
//     );
//   }
// }
>>>>>>> Stashed changes:lib/app/modules/sprint/pages/sprint_page.dart

import 'package:flutter/material.dart';
import 'package:working_time/app/core/enums/page_state_enum.dart';
import 'package:working_time/app/modules/sprint/controllers/sprint_controller.dart';
import 'package:working_time/app/modules/sprint/widgets/day_card.dart';
import 'package:working_time/app/modules/sprint/widgets/sprint_bar.dart';

class SprintPage extends StatelessWidget {
  final SprintController sprintController;

  const SprintPage(
    this.sprintController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    sprintController.init();

    return Scaffold(
      body: AnimatedBuilder(
        animation: sprintController,
        builder: (context, _) {
          switch (sprintController.pageState) {
            case PageStateEnum.load:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PageStateEnum.empty:
            case PageStateEnum.error:
              return const Center(
                child: Text('Algo aconteceu, tente novamente!'),
              );

            case PageStateEnum.success:
              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    SprintBar(
                      sprintEntity: sprintController.sprint!,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 32,
                    ),
                    Expanded(
                      child: CalendarDatePicker(
                        firstDate: sprintController.sprint!.initialDate,
                        lastDate: sprintController.sprint!.finalDate,
                        initialDate: sprintController.sprint!.initialDate,
                        onDateChanged: (date) =>
                            sprintController.changeDay(date),
                      ),
                    ),
                    Expanded(
                      child: sprintController.day == null
                          ? InkWell(
                              onTap: () => sprintController.addDay(),
                              splashColor: Colors.transparent,
                              child: const Center(
                                child: Text('Adicione Anotações Aqui'),
                              ),
                            )
                          : DayCard(
                              dayEntity: sprintController.day!,
                              onSave: (day) => sprintController.updateDay(day),
                            ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

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

//           default:
//             return const SizedBox();
//         }
//       }),
//     );
//   }
// }

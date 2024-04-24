import 'package:flutter/material.dart';
import 'package:working_time/app/core/enums/page_state_enum.dart';
import 'package:working_time/app/modules/sprint/controllers/sprint_controller.dart';
import 'package:working_time/app/modules/sprint/widgets/day_card.dart';
import 'package:working_time/app/modules/sprint/widgets/sprint_bar.dart';

class SprintPage extends StatefulWidget {
  final SprintController sprintController;

  const SprintPage(
    this.sprintController, {
    super.key,
  });

  @override
  State<SprintPage> createState() => _SprintPageState();
}

class _SprintPageState extends State<SprintPage> {
  @override
  Widget build(BuildContext context) {
    widget.sprintController.init();

    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.sprintController,
        builder: (context, _) {
          switch (widget.sprintController.pageState) {
            case PageStateEnum.load:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PageStateEnum.empty:
            case PageStateEnum.error:
              return const Center(
                child: Text(
                  'Algo aconteceu, tente novamente!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              );

            case PageStateEnum.success:
              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    SprintBar(
                      sprintEntity: widget.sprintController.sprint!,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 32,
                    ),
                    Expanded(
                      child: CalendarDatePicker(
                        firstDate: widget.sprintController.sprint!.initialDate,
                        lastDate: widget.sprintController.sprint!.finalDate,
                        initialDate:
                            widget.sprintController.sprint!.initialDate,
                        onDateChanged: (date) =>
                            widget.sprintController.changeDay(date),
                      ),
                    ),
                    Expanded(
                      child: widget.sprintController.day == null
                          ? InkWell(
                              onTap: () => widget.sprintController.addDay(),
                              splashColor: Colors.transparent,
                              child: const Center(
                                child: Text('Clique e adicione uma anotação'),
                              ),
                            )
                          : DayCard(
                              dayEntity: widget.sprintController.day!,
                              onSave: (day) =>
                                  widget.sprintController.updateDay(day),
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

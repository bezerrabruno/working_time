import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/size_util.dart';
import 'package:working_time/app/core/enums/page_state_enum.dart';
import 'package:working_time/app/core/routes/app_pages.dart';
import 'package:working_time/app/core/services/app_service.dart';
import 'package:working_time/app/modules/list_sprint/controllers/list_sprint_controller.dart';
import 'package:working_time/app/modules/list_sprint/widgets/sprint_card.dart';

class ListSprintPage extends StatefulWidget {
  final ListSprintController listSprintController;

  const ListSprintPage(
    this.listSprintController, {
    super.key,
  });

  @override
  State<ListSprintPage> createState() => _ListSprintPageState();
}

class _ListSprintPageState extends State<ListSprintPage> {
  @override
  Widget build(BuildContext context) {
    widget.listSprintController.getSprints();

    return ListenableBuilder(
      listenable: widget.listSprintController,
      builder: (context, _) {
        switch (widget.listSprintController.pageState) {
          case PageStateEnum.load:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case PageStateEnum.empty:
            return Scaffold(
              body: InkWell(
                onTap: () => widget.listSprintController.addSprint(context),
                child: const Center(
                  child: Text(
                    'Clique e adicione sua primeira sprint a lista',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            );

          case PageStateEnum.error:
            return const Scaffold(
              body: Center(
                child: Text(
                  'Algo aconteceu, tente novamente!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            );

          case PageStateEnum.success:
            return Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtil.width(context) / 8,
                  vertical: 16,
                ),
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () =>
                        widget.listSprintController.addSprint(context),
                    child: const Text('Adicionar Sprint'),
                  ),
                ),
              ),
              body: ListView.builder(
                itemCount: widget.listSprintController.sprints.length,
                itemBuilder: (context, index) {
                  return SprintCard(
                    sprintEntity: widget.listSprintController.sprints[index],
                    onTap: () {
                      appService.sprintAtual =
                          widget.listSprintController.sprints[index];

                      Navigator.of(context).pushNamed(AppRoutes.sprint);
                    },
                  );
                },
              ),
            );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:working_time/app/core/enums/page_state_enum.dart';
import 'package:working_time/app/core/routes/app_pages.dart';
import 'package:working_time/app/core/services/app_service.dart';
import 'package:working_time/app/modules/list_sprint/controllers/list_sprint_controller.dart';
import 'package:working_time/app/modules/list_sprint/widgets/sprint_card.dart';

class ListSprintPage extends StatelessWidget {
  final ListSprintController listSprintController;

  const ListSprintPage(
    this.listSprintController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    listSprintController.getSprints();

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 4, vertical: 16),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () => listSprintController.addSprint(context),
            child: const Text('Adicionar Sprint'),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: listSprintController,
        builder: (context, _) {
          switch (listSprintController.pageState) {
            case PageStateEnum.load:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PageStateEnum.empty:
              return InkWell(
                onTap: () => listSprintController.addSprint(context),
                child: const Center(
                  child: Text(
                    'Adicione uma sprint a lista',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              );

            case PageStateEnum.error:
              return const Center(
                child: Text('Algo aconteceu, tente novamente!'),
              );

            case PageStateEnum.success:
              return ListView.builder(
                itemCount: listSprintController.sprints.length,
                itemBuilder: (context, index) {
                  return SprintCard(
                    sprintEntity: listSprintController.sprints[index],
                    onTap: () {
                      appService.sprintAtual =
                          listSprintController.sprints[index];

                      Navigator.of(context).pushNamed(AppRoutes.sprint);
                    },
                  );
                },
              );
          }
        },
      ),
    );
  }
}

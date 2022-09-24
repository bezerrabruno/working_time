import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/app/core/utils/page_state.dart';
import '../store/sprints_store.dart';
import '../widgets/dialog_add_sprint.dart';

class SprintsPage extends StatefulWidget {
  const SprintsPage({Key? key}) : super(key: key);

  @override
  State<SprintsPage> createState() => _SprintsPageState();
}

class _SprintsPageState extends State<SprintsPage> {
  final store = Modular.get<SprintsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return DialogAddSprint(
                  save: () => store.saveSprint(),
                );
              });
        },
      ),
      body: Observer(
        builder: (context) {
          switch (store.state) {
            case PageState.load:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PageState.error:
              return const Center(
                child: Text('Erro ao carregar a lista de sprints'),
              );
            case PageState.empty:
              return const Center(
                child: Text('Cadastre uma sprint'),
              );
            case PageState.success:
              return ListView.builder(
                itemCount: store.sprints.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      color: Colors.amber,
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}

// body: Obx(() {
// switch (controller.state) {
// case StatusType.load:
// return const Center(
// child: CircularProgressIndicator(),
// );
//
// case StatusType.error:
// case StatusType.success:
// if (controller.sprints.isEmpty) {
// return const Center(
// child: Text(
// 'Adicione uma sprint a lista',
// style: TextStyle(fontSize: 36),
// ),
// );
// } else {
// return ListView.builder(
// itemCount: controller.sprints.length,
// itemBuilder: (context, item) {
// return CardSprint(
// sprint: controller.sprints[item],
// );
// },
// );
// }
//
// default:
// return const SizedBox();
// }
// }),
// );

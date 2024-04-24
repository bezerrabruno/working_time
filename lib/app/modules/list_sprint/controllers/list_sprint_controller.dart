import 'package:flutter/material.dart';
import 'package:working_time/app/core/enums/page_state_enum.dart';
import 'package:working_time/app/db/boxes/sprint_box.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';
import 'package:working_time/app/modules/list_sprint/widgets/add_sprint_dialog.dart';

class ListSprintController extends ChangeNotifier {
  final SprintBox sprintBox;

  ListSprintController(this.sprintBox);

  /// Vars
  PageStateEnum _pageState = PageStateEnum.load;

  List<SprintEntity> _sprints = [];

  /// Uses
  PageStateEnum get pageState => _pageState;

  List<SprintEntity> get sprints => _sprints;

  /// funcs
  Future<void> getSprints() async {
    _pageState = PageStateEnum.load;

    await Future.delayed(const Duration(seconds: 1));

    notifyListeners();

    try {
      _sprints = await sprintBox.getAll();

      if (_sprints.isEmpty) {
        _pageState = PageStateEnum.empty;
      } else {
        _pageState = PageStateEnum.success;
      }
    } catch (e) {
      _pageState = PageStateEnum.error;
    } finally {
      notifyListeners();
    }
  }

  void addSprint(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddSprintDialog(
          finish: (sprint) async {
            sprintBox.update(sprint);

            Navigator.of(context).pop();

            await getSprints();
          },
        );
      },
    );
  }
}

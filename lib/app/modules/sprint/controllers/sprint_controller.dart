import 'package:flutter/material.dart';
import 'package:working_time/app/core/enums/page_state_enum.dart';
import 'package:working_time/app/core/services/app_service.dart';
import 'package:working_time/app/db/boxes/day_box.dart';
import 'package:working_time/app/db/entities/day_entity.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';

class SprintController extends ChangeNotifier {
  final DayBox dayBox;

  SprintController(this.dayBox);

  /// Vars
  PageStateEnum _pageState = PageStateEnum.load;

  SprintEntity? _sprintEntity;
  DayEntity? _dayEntity;
  DateTime? _date;

  /// Uses
  PageStateEnum get pageState => _pageState;
  SprintEntity? get sprint => _sprintEntity;
  DayEntity? get day => _dayEntity;

  Future<void> init() async {
    _pageState = PageStateEnum.load;
    notifyListeners();

    _sprintEntity = appService.sprintAtual;

    _dayEntity =
        await dayBox.get(_sprintEntity!.initialDate.millisecondsSinceEpoch);

    _date = _sprintEntity!.initialDate;

    _pageState = PageStateEnum.success;
    notifyListeners();
  }

  Future<void> addDay() async {
    DayEntity day = DayEntity(date: _date!, time: 0, comment: '');

    await dayBox.update(day);

    await changeDay(_date!);
  }

  Future<void> changeDay(DateTime date) async {
    _date = date;

    _dayEntity = await dayBox.get(date.millisecondsSinceEpoch);
    notifyListeners();
  }

  Future<void> updateDay(DayEntity day) async {
    await dayBox.update(day);

    await changeDay(_date!);
  }
}

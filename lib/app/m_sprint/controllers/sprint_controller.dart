import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/day.dart';

enum StatusType { success, load, error, empty }

class SprintController extends GetxController {
  var box = Hive.box('sprint');

  final _state = StatusType.load.obs;
  StatusType get state => _state.value;
  set state(StatusType value) => _state.value = value;

  final _subState = StatusType.load.obs;
  StatusType get subState => _subState.value;
  set subState(StatusType value) => _subState.value = value;

  final _currentDate = DateTime(2022).obs;
  DateTime get currentDate => _currentDate.value;
  set currentDate(DateTime value) => _currentDate.value = value;

  final _dayInfo = Day().obs;
  Day get dayInfo => _dayInfo.value;
  set dayInfo(Day value) => _dayInfo.value = value;

  initilState() async {
    currentDate = DateTime.now();
    await getInfo(currentDate);
    subState = StatusType.success;
    state = StatusType.success;
  }

  getInfo(DateTime date) async {
    subState = StatusType.load;

    final result = await box.get('${date.year}/${date.month}/${date.day}');

    await Future.delayed(const Duration(milliseconds: 300));

    if (result != null) {
      dayInfo = Day.fromMap(result);
      subState = StatusType.success;
    } else {
      final save = Day(
        date: date,
        day: date.day,
        iTime: 0,
        fTime: 5,
      );

      await box.put('${date.year}/${date.month}/${date.day}', Day.toMap(save));

      getInfo(date);
    }
  }

  saveCard() async {
    await box.put(
        '${dayInfo.date!.year}/${dayInfo.date!.month}/${dayInfo.date!.day}',
        Day.toMap(dayInfo));

    Get.showSnackbar(
      const GetSnackBar(
        title: 'Dia Salvo',
        duration: Duration(seconds: 2),
        messageText: Text('Seu fia foi salvo com sucesso'),
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  clear() {
    box.clear();
  }
}

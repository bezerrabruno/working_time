import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:working_time/app/modules/list_sprint/widgets/dialog_add_sprint.dart';

import '../models/sprint.dart';

enum StatusType { success, load, error, empty }

class ListSprintController extends GetxController {
  var box = Hive.box('sprint');

  final _state = StatusType.load.obs;
  StatusType get state => _state.value;
  set state(StatusType value) => _state.value = value;

  final _sprints = <Sprint>[].obs;
  List<Sprint> get sprints => _sprints;
  set sprints(List<Sprint> value) => _sprints.value = value;

  @override
  void onInit() {
    getSprints();
    super.onInit();
  }

  getSprints() async {
    state = StatusType.load;

    List? result = await box.get('sprints');

    await Future.delayed(const Duration(seconds: 1));

    if (result != null) {
      sprints = Sprint.fromMap(result);
      state = StatusType.success;
    } else {
      await box.put('sprints', []);
      result = [];
      state = StatusType.success;
    }
  }

  addSprint() {
    Get.dialog(const DialogAddSprint());
  }

  clear() {
    box.clear();
  }
}

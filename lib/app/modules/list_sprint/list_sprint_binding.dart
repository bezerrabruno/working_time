import 'package:get/get.dart';

import 'controllers/list_sprint_controller.dart';

class ListSprintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListSprintController());
  }
}

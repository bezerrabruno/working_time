import 'package:get/get.dart';

import '/app/modules/list_sprint/list_sprint_binding.dart';
import '/app/modules/list_sprint/pages/list_sprint_page.dart';
import '/app/modules/sprint/pages/sprint_page.dart';
import '/app/modules/sprint/sprint_binding.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.listSprint,
      page: () => const ListSprintPage(),
      binding: ListSprintBinding(),
    ),
    GetPage(
        name: Routes.sprint,
        page: () => const SprintPage(),
        binding: SprintBinding()),
  ];
}

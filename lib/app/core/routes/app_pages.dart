import 'package:working_time/app/db/box_db/object_box.dart';
import 'package:working_time/app/db/boxes/day_box.dart';
import 'package:working_time/app/db/boxes/sprint_box.dart';
import 'package:working_time/app/modules/list_sprint/controllers/list_sprint_controller.dart';
import 'package:working_time/app/modules/sprint/controllers/sprint_controller.dart';

import '/app/modules/list_sprint/pages/list_sprint_page.dart';
import '/app/modules/sprint/pages/sprint_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = {
    AppRoutes.listSprint: (context) =>
        ListSprintPage(ListSprintController(SprintBox(appBox))),
    AppRoutes.sprint: (context) => SprintPage(SprintController(DayBox(appBox))),
  };
}

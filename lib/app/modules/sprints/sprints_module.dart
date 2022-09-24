import 'package:flutter_modular/flutter_modular.dart';
import 'package:working_time/app/modules/sprints/store/sprints_store.dart';

import 'pages/sprints_page.dart';

class SprintsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => SprintsStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SprintsPage(),
        ),
      ];
}

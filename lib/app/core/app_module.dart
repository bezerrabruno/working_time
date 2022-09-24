import 'package:flutter_modular/flutter_modular.dart';

import '/app/modules/sprints/sprints_module.dart';
import 'database/db.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ObjectBox()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SprintsModule()),
      ];
}

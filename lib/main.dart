import 'package:flutter/material.dart';
import 'package:working_time/app/core/services/app_service.dart';
import 'package:working_time/app/db/box_db/object_box.dart';

import 'app/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initApp();

  runApp(const AppWidget());
}

Future<void> initApp() async {
  appBox = ObjectBox();
  appService = AppService();
}

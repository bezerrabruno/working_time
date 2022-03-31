import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(const AppWidget());
}

Future<void> initApp() async {
  await Hive.initFlutter();
  await Hive.openBox('day');
}

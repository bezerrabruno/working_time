import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Working Time',
      theme: ThemeApp.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.listSprint,
      getPages: AppPages.pages,
    );
  }
}

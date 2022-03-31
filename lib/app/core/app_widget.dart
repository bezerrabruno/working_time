import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/m_sprint/pages/sprint_page.dart';

import 'app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Working Time',
      theme: ThemeApp.dark(),
      debugShowCheckedModeBanner: false,
      home: const SprintPage(),
    );
  }
}

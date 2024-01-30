import 'package:flutter/material.dart';
import 'package:working_time/app/core/routes/app_pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Working Time',
      initialRoute: AppRoutes.listSprint,
      routes: AppPages.pages,
    );
  }
}

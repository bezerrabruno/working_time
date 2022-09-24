import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

<<<<<<< Updated upstream
import '/app/m_sprint/sprint_binding.dart';
import '/app/m_sprint/pages/sprint_page.dart';

import 'app_theme.dart';
=======
import 'theme/app_theme.dart';
>>>>>>> Stashed changes

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Working Time',
<<<<<<< Updated upstream
      theme: ThemeApp.dark(),
      debugShowCheckedModeBanner: false,
      home: const SprintPage(),
      initialBinding: SprintBinding(),
    );
=======
      darkTheme: ThemeApp.dark(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //add
>>>>>>> Stashed changes
  }
}

import 'package:flutter/material.dart';
import '../../view/tasks/add_edit_task.dart';
import '../../view/home/home_page.dart';
import '../../view/onboard/splash_screen.dart';

class Routes {
  Routes._();

  static const splash = '/splash_screen';
  static const home = '/home';
  static const task = '/home/task';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    home: (BuildContext context) => const HomePage(),
    task: (BuildContext context) => AddEditTask()
  };
}

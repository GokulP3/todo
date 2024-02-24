import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_model/task.dart';
import '../../utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _gotoHome();
    super.initState();
  }

  void _gotoHome() {
    Future.delayed(const Duration(seconds: 2), () {
      context.read<TaskViewModel>().getTask();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.home, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return const Center(
      child: Icon(
        Icons.flutter_dash_rounded,
        color: Colors.blue,
        size: 100,
      ),
    );
  }
}

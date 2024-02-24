import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/providers.dart';
import 'firebase_options.dart';
import '../utils/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder())),
        routes: Routes.routes,
        initialRoute: Routes.splash,
      ),
    );
  }
}

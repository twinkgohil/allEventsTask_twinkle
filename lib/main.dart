import 'package:all_events_task/modules/splash/splash_binding.dart';
import 'package:all_events_task/modules/splash/splash_view.dart';
import 'package:all_events_task/shared/constant/color_constant.dart';
import 'package:all_events_task/shared/constant/storage_constatnt.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AllEventsApp',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: ColorConstants.white),
      initialBinding:SplashBinding(),
      home: const SplashScreen(),
    );
  }
}

import 'package:all_events_task/modules/login/login_binding.dart';
import 'package:all_events_task/modules/login/login_view.dart';
import 'package:all_events_task/modules/splash/splash_controller.dart';
import 'package:all_events_task/shared/constant/color_constant.dart';
import 'package:all_events_task/shared/constant/image_constatnt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.name);
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Image(image: AssetImage(ImageConstants.splashImage)),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:all_events_task/modules/home/home_binding.dart';
import 'package:all_events_task/modules/home/home_view.dart';
import 'package:all_events_task/modules/login/login_binding.dart';
import 'package:all_events_task/modules/login/login_view.dart';
import 'package:all_events_task/services/storage_service.dart';
import 'package:all_events_task/shared/constant/storage_constatnt.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
  final prefs = Get.find<SharedPreferences>();
  var name = 'splash'.obs;

  @override
  void onInit() async {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () => prefs.getString(StorageConstants.userData) != null
          ? Get.off(const HomeView(), binding: HomeBinding())
          : Get.off(const LoginView(), binding: LoginBinding()),
    );

    super.onInit();
  }
}

import 'package:all_events_task/services/storage_service.dart';
import 'package:all_events_task/shared/constant/storage_constatnt.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static final prefs = Get.find<SharedPreferences>();
  static var userName = ''.obs;

  //Init SharedPreference

  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }

}

import 'package:all_events_task/modules/categories_listing/listing_controller.dart';
import 'package:get/get.dart';

class ListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListingController());
  }
}
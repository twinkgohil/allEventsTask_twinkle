import 'package:all_events_task/api/api_repository.dart';
import 'package:all_events_task/model/get_category_response.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';


class HomeController extends GetxController {
  ApiRepository apiRepository = ApiRepository();
  var categories = <GetCategories>[].obs;
  var selectedIndex = 100000.obs;
  RxBool isValid = false.obs;

  getEventCategories() async {
    var res = await apiRepository.getCategories();
    if (res != null) {
      categories.value = res;
      return res;
    }
    return null;
  }

  @override
  void onInit() {
    getEventCategories();
    super.onInit();
  }
}

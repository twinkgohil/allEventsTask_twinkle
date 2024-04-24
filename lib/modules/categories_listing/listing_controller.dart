import 'package:all_events_task/api/api_repository.dart';
import 'package:all_events_task/model/get_category_listing_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ListingController extends GetxController {

  ApiRepository apiRepository = ApiRepository();
  var getEventDetails = CategoryListingResponse().obs;
  var selectedIndex = 0.obs;

  getEventListingData(String url)async{
    var res = await apiRepository.getEventDetails(baseUrl: url);
    if(res != null){
      getEventDetails.value = res;
    }
  }

  @override
  void onInit() {
    getEventListingData(Get.arguments);
    super.onInit();
  }

}
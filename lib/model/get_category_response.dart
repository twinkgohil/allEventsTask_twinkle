import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class GetCategories {
  String? category;
  String? data;
  RxBool isSelected = false.obs;

  GetCategories({this.category, this.data});

  GetCategories.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['data'] = this.data;
    return data;
  }
}

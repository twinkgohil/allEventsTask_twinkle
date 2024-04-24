import 'package:all_events_task/api/api_provider.dart';
import 'package:all_events_task/model/get_category_listing_response.dart';
import 'package:all_events_task/model/get_category_response.dart';

class ApiRepository {
  ApiProvider apiProvider = ApiProvider();
  static const baseUrl =
      "https://allevents.s3.amazonaws.com/tests/categories.json";

  Future<List<GetCategories>?> getCategories() async {
    final res = await apiProvider.getMethod(baseUrl);
    if (res.data != null) {
      var list = res.data as List<dynamic>;
      return list.map((e) => GetCategories.fromJson(e)).toList();
    }
    return null;
  }

  Future<CategoryListingResponse?> getEventDetails(
      {required String baseUrl}) async {
    final res = await apiProvider.getMethod(baseUrl);
    if (res.data != null) {
      return CategoryListingResponse.fromJson(res.data as Map<String, dynamic>);
    }
    return null;
  }
}

import 'package:dio/dio.dart';

class ApiProvider {
  var dio = Dio();

  Future<Response> getMethod(String path,
      {Map<String, dynamic>? queryParameters}) async {
    var response = await dio
        .get(
      path,
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json'
        },
      ),
      queryParameters: queryParameters,
    )
        .catchError((e) {
      print("==ERROR===${e.toString()}");
      return e;
    });
    // print("RESPONSE ======= ${response.data}");
    if (response.statusCode == 200 && response.data != null) {
      print("response.data ::::::::::: ${response.data}");
    }
    return response;
  }
}

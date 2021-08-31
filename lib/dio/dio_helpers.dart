import 'package:dio/dio.dart';

class dio_helpers {
  static late Dio mydio;

  static init() {
    mydio = Dio(
        BaseOptions(
        baseUrl: "https://newsapi.org/", receiveDataWhenStatusError: true)
    );
  }

  static Future get_data({required String url, required Map<String, dynamic> query,}) async {
    return await mydio.get(
        url,
        queryParameters: query

    );
  }
}

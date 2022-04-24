import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://app.fakejson.com/q/xdqGGa4e?token=MmSjTp1p8t-exolhzJqYlg',
          receiveDataWhenStatusError: true,
          connectTimeout: 50000,
          receiveTimeout: 50000,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

// start Get Data
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

// End Get Data
}
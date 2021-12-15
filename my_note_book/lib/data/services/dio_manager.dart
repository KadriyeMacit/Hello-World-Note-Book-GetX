import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioManager {
  late Dio dio;

  static const String _baseUrl = 'http://kadriyemacit.com/';

  DioManager() {
    dio = Dio(
      BaseOptions(
          baseUrl: _baseUrl,
          validateStatus: (int? status) {
            int finalStatus = status ?? -1;
            return finalStatus >= 200 && finalStatus < 300;
          },
          headers: {"Content-Type": "application/json"}),
    );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };

    dio.interceptors;
  }
}

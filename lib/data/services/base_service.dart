import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/common/config/app_config.dart';
import 'package:research_flutter_unit_test/data/api/rest_api.dart';

class BaseService extends GetxService {
  late RestAPI client;
  final dio = Dio();

  @override
  void onInit() {
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(LogInterceptor(responseHeader: false, responseBody: true, request: true, requestBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      String token = "";

      if (token.isNotEmpty) {
        options.headers['Authorization'] = "Bearer $token";
      }

      handler.next(options);
    }));

    AppConfig conf = Get.find();
    client = RestAPI(
      dio,
      baseUrl: conf.baseURL,
    );

    super.onInit();
  }
}

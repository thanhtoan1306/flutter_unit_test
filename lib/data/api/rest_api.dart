import 'package:dio/dio.dart';
import 'package:research_flutter_unit_test/data/models/base_response.dart';

import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  // Auth
  @POST("v1/auth/user/login-phone")
  Future<BaseResponse> loginWithPhone(@Body() Map<String, dynamic> body);
}

import 'package:flutter_config/flutter_config.dart';
import 'package:research_flutter_unit_test/common/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/main.dart' as common;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  var baseURL = FlutterConfig.get('BASE_URL');
  AppConfig config = AppConfig(env: Environment.dev, config: {FLAVOR: "prod", BASE_URL: baseURL});
  Get.put<AppConfig>(config, permanent: true);
  common.main();
}

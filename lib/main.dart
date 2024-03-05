import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/data/repositories/account/account_repository.dart';
import 'package:research_flutter_unit_test/data/repositories/account/iaccount_repository.dart';
import 'package:research_flutter_unit_test/data/services/base_service.dart';
import 'package:research_flutter_unit_test/routes/app_pages.dart';
import 'package:research_flutter_unit_test/utils/theme/theme.dart';
import 'package:research_flutter_unit_test/widgets/responsive/size_config.dart';

final ReceivePort backgroundMessageport = ReceivePort();

void main() {
  Get.put<BaseService>(BaseService(), permanent: true);
  Get.put<AccountRepository>(AccountRepository(api: Get.find()), permanent: true);
  Get.put<IAccountRepository>(AccountRepository(api: Get.find()), permanent: true);

  var getMaterialApp = GetMaterialApp(
    themeMode: ThemeMode.system,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ko', 'KR'),
    ],
    localizationsDelegates: const [],
    debugShowCheckedModeBanner: false,
    getPages: AppPages.pages,
    initialRoute: Routes.LOGIN,
    builder: EasyLoading.init(builder: (context, child) => child!),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig(
              designScreenWidth: 375,
              designScreenHeight: 812,
            ).init(constraints, orientation);
            return getMaterialApp;
          },
        );
      },
    ));
  });
}

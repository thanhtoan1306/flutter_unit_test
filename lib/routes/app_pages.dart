import 'package:get/get.dart';
import 'package:research_flutter_unit_test/modules/forgot_password/forgot_password_binding.dart';
import 'package:research_flutter_unit_test/modules/forgot_password/forgot_password_page.dart';
import 'package:research_flutter_unit_test/modules/login/login_binding.dart';
import 'package:research_flutter_unit_test/modules/login/login_page.dart';
import 'package:research_flutter_unit_test/modules/main/main_binding.dart';
import 'package:research_flutter_unit_test/modules/main/main_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
        GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}

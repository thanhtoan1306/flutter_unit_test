import 'package:get/get.dart';
import 'package:research_flutter_unit_test/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(accountRepository: Get.find()));
  }
}

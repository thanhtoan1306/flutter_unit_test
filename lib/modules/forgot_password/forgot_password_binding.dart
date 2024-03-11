import 'package:get/get.dart';
import 'package:research_flutter_unit_test/modules/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}

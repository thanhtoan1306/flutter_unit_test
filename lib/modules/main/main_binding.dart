import 'package:get/get.dart';
import 'package:research_flutter_unit_test/modules/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}

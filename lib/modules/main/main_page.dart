import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/modules/main/main_controller.dart';
import 'package:research_flutter_unit_test/widgets/base_widget.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseWidget(child: Center(child: Text("Trang chủ")));
  }
}

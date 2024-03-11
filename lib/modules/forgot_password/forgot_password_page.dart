import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/modules/forgot_password/forgot_password_controller.dart';
import 'package:research_flutter_unit_test/utils/styles.dart';
import 'package:research_flutter_unit_test/widgets/base_widget.dart';

class ForgotPasswordPage extends GetWidget<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: padding(all: 16),
          child: const Center(
            child: Text("Forgot password screen"),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/modules/login/login_controller.dart';
import 'package:research_flutter_unit_test/routes/app_pages.dart';
import 'package:research_flutter_unit_test/utils/styles.dart';
import 'package:research_flutter_unit_test/widgets/base_widget.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        body: Padding(
          padding: padding(all: 16),
          child: Obx(() {
            return Column(
              children: [
                TextField(
                  key: const Key('email_input'),
                  controller: controller.emailController,
                  onChanged: controller.validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: controller.isEmailValid.value == null
                        ? null
                        : (controller.isEmailValid.value! ? null : 'Invalid email'),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  key: const Key('password_input'),
                  controller: controller.passwordController,
                  onChanged: controller.validatePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: controller.isPasswordValid.value == null
                        ? null
                        : (controller.isPasswordValid.value! ? null : 'Password too short'),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                InkWell(
                  key: const Key('login_button_click'),
                  onTap: controller.isEmailValid.value == true && controller.isPasswordValid.value == true
                      ? () {
                          // Handle login button press
                        }
                      : null,
                  child: Container(
                    key: const Key('login_button'),
                    padding: const EdgeInsets.all(10),
                    color: controller.isEmailValid.value == true && controller.isPasswordValid.value == true
                        ? Colors.blue
                        : Colors.grey, // Change color based on input validation
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  key: const Key('forgot_password_click'),
                  onTap: () {
                    Get.toNamed(Routes.FORGOT_PASSWORD);
                  },
                  child: const Text(
                    'Forgot password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

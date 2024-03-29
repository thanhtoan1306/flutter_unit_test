import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:research_flutter_unit_test/data/models/account.dart';
import 'package:research_flutter_unit_test/data/repositories/account/account_repository.dart';
import 'package:research_flutter_unit_test/data/repositories/account/iaccount_repository.dart';
import 'package:research_flutter_unit_test/routes/app_pages.dart';
import 'package:research_flutter_unit_test/utils/extensions.dart';

class LoginController extends GetxController {
  final IAccountRepository _accountRepository;

  LoginController({required IAccountRepository accountRepository}) : _accountRepository = accountRepository;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString errorText = "".obs;
  Rx<bool?> isEmailValid = Rx<bool?>(null);
  Rx<bool?> isPasswordValid = Rx<bool?>(null);

  Future<bool> login() async {
    String phone = phoneController.text;
    if (phone.isNullOrEmpty) {
      errorText.value = "Vui lòng nhập số điện thoại";
      return false;
    }
    if (!GetUtils.isPhoneNumber(phone)) {
      errorText.value = "Số điện thoại không hợp lệ";
      return false;
    }
    Account? response = await _accountRepository.loginWithPhone(
        phone, "zHHqZE4dfFBI5i4hur0sbRrTwYA6EUWZTSOZYQWZIWuoDJIFAxSlzXSw4Z3679c8");

    return response != null;
  }

  Future<void> loginWithEmail() async {
    final result = await _accountRepository.loginWithEmail(emailController.text, passwordController.text);
    if (result != null) {
      Get.toNamed(Routes.MAIN);
    }
  }

  Future<void> navLogin() async {
    bool loginSucess = await login();
    if (loginSucess) {
      Get.toNamed(Routes.MAIN);
    }
  }

  void validateEmail(String email) {
    isEmailValid.value = GetUtils.isEmail(email);
  }

  void validatePassword(String password) {
    isPasswordValid.value = password.length >= 6;
  }

  @visibleForTesting
  void putToPhoneController(String phone) {
    phoneController.text = phone;
  }
}

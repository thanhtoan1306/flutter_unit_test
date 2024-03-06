import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/common/component/component.dart';
import 'package:research_flutter_unit_test/modules/login/login_controller.dart';
import 'package:research_flutter_unit_test/utils/extensions.dart';
import 'package:research_flutter_unit_test/utils/styles.dart';
import 'package:research_flutter_unit_test/widgets/base_widget.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: padding(all: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mời bạn nhập số điện thoại'.hardCoded,
                      style: Component.textStyle.size_24_w_800.copyWith(
                        color: Component.color.secondary,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            if (controller.errorText.value.isNotEmpty) {
                              controller.errorText.value = "";
                            }
                          },
                          controller: controller.phoneController,
                          style: Component.textStyle.size_28_w_400,
                          maxLength: 10,
                          cursorColor: Component.color.secondary,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "0987654321",
                            hintStyle: Component.textStyle.size_28_w_400.copyWith(
                              color: Component.color.disable,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Component.color.secondary,
                              ),
                            ),
                            counter: const SizedBox.shrink(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.phoneController.clear();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ),
                        Obx(() {
                          if (controller.errorText.value.isEmpty) return const SizedBox.shrink();
                          return Text(
                            controller.errorText.value,
                            style: Component.textStyle.size_14_w_400.copyWith(
                              color: Component.color.warningColor,
                            ),
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  key: const Key('loginButton'), // Assign key for Widget. This is important for write test case
                  onTap: () {
                    controller.navLogin();
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  child: Ink(
                    height: width(56),
                    width: width(56),
                    decoration: BoxDecoration(
                      color: Component.color.secondary,
                      borderRadius: const BorderRadius.all(Radius.circular(90)),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Icon(
                        Icons.east,
                        color: Component.color.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading({String? msg}) {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.black
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 46.0
    ..radius = 13.0
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.transparent
    ..maskColor = Colors.transparent
    ..boxShadow = <BoxShadow>[]
    ..userInteractions = true
    ..textColor = Colors.white
    ..dismissOnTap = false;
  EasyLoading.show(status: msg);
}

void dismissLoading() {
  EasyLoading.dismiss();
}

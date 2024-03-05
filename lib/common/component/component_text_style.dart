// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

const _normalRegular = TextStyle(color: Colors.black, fontFamily: 'Nunito');

class ComponentTextStyle {
  TextStyle size_28_w_600 = const TextStyle(fontWeight: FontWeight.w600, fontSize: 28).merge(_normalRegular);
  TextStyle size_28_w_400 = const TextStyle(fontWeight: FontWeight.w400, fontSize: 28).merge(_normalRegular);
  TextStyle size_24_w_800 = const TextStyle(fontWeight: FontWeight.w800, fontSize: 24).merge(_normalRegular);
  TextStyle size_18_w_800 = const TextStyle(fontWeight: FontWeight.w800, fontSize: 18).merge(_normalRegular);
  TextStyle size_16_w_800 = const TextStyle(fontWeight: FontWeight.w800, fontSize: 16).merge(_normalRegular);
  TextStyle size_16_w_600 = const TextStyle(fontWeight: FontWeight.w600, fontSize: 16).merge(_normalRegular);
  TextStyle size_14_w_800 = const TextStyle(fontWeight: FontWeight.w800, fontSize: 14).merge(_normalRegular);
  TextStyle size_14_w_600 = const TextStyle(fontWeight: FontWeight.w600, fontSize: 14).merge(_normalRegular);
  TextStyle size_14_w_400 = const TextStyle(fontWeight: FontWeight.w400, fontSize: 14).merge(_normalRegular);
}

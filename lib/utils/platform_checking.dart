import 'package:flutter/foundation.dart';

class PlatformCheck {
  PlatformCheck._();
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
}

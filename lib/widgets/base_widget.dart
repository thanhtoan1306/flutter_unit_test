import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:research_flutter_unit_test/utils/platform_checking.dart';

class BaseWidget extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool? preventBack;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Future<bool> Function()? onWillPop;
  final PreferredSizeWidget? appBar;
  final Color? topBarColor;
  final Color? bottomBarColor;
  final bool resizeToAvoidBottomInset;
  final bool isSafeArea;
  final bool extendBody;
  const BaseWidget(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.preventBack,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.onWillPop,
      this.appBar,
      this.topBarColor,
      this.bottomBarColor,
      this.resizeToAvoidBottomInset = true,
      this.isSafeArea = true,
      this.extendBody = false});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  ///###
  Brightness get brightnessIOS => !Get.isDarkMode ? Brightness.light : Brightness.dark;
  Brightness get brightnessAndroid => !Get.isDarkMode ? Brightness.dark : Brightness.light;
  Brightness get systemUIOverlay => PlatformCheck.isIOS ? brightnessIOS : brightnessAndroid;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarBrightness: systemUIOverlay,
            statusBarIconBrightness: systemUIOverlay,
            statusBarColor: Theme.of(context).scaffoldBackgroundColor),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: widget.topBarColor ?? Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: widget.bottomBarColor ?? Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
              SafeArea(
                top: widget.isSafeArea,
                bottom: widget.isSafeArea,
                left: widget.isSafeArea,
                right: widget.isSafeArea,
                child: ClipRRect(
                  child: Scaffold(
                    extendBody: widget.extendBody,
                    resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                    backgroundColor: widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
                    appBar: widget.appBar,
                    body: widget.child,
                    floatingActionButton: widget.floatingActionButton,
                    bottomNavigationBar: widget.bottomNavigationBar,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

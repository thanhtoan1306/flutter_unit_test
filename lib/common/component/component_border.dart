import 'package:research_flutter_unit_test/common/component/component.dart';

import 'package:flutter/material.dart';

class ComponentBorder {
  BoxBorder border({Color? color}) => Border.all(color: color ?? Component.color.secondary, width: 1);

  OutlineInputBorder borderTextField = OutlineInputBorder(
    borderRadius: Component.radius.radius6,
    borderSide: BorderSide(color: Component.color.secondary, width: 1),
  );

  OutlineInputBorder borderDisableTextField = OutlineInputBorder(
    borderRadius: Component.radius.radius6,
    borderSide: BorderSide(color: Component.color.secondary, width: 1),
  );

  OutlineInputBorder borderErrorTextField = OutlineInputBorder(
    borderRadius: Component.radius.radius6,
    borderSide: BorderSide(color: Component.color.warningColor, width: 1),
  );

  OutlineInputBorder borderTextFieldRadiusZero = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(color: Component.color.secondary, width: 1),
  );

  OutlineInputBorder focusedBorderTextFieldRadiusZero = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(color: Component.color.secondary),
  );
}

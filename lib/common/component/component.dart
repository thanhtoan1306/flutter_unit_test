// ignore_for_file: non_constant_identifier_names
import 'package:research_flutter_unit_test/common/component/component_border.dart';
import 'package:research_flutter_unit_test/common/component/component_color.dart';
import 'package:research_flutter_unit_test/common/component/component_icon.dart';
import 'package:research_flutter_unit_test/common/component/component_radius.dart';
import 'package:research_flutter_unit_test/common/component/component_text_style.dart';

class Component {
  static ComponentRadius radius = ComponentRadius();
  static ComponentColor color = ComponentColor();
  static ComponentTextStyle textStyle = ComponentTextStyle();
  static ComponentIconPaths iconPaths = ComponentIconPaths();
  static ComponentBorder border = ComponentBorder();
}

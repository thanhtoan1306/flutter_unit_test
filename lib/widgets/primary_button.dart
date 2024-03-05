import 'dart:io';
import 'package:flutter/material.dart';
import 'package:research_flutter_unit_test/common/component/component.dart';
import 'package:research_flutter_unit_test/utils/styles.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final Function() onPressed;
  final Color? backgroudColor;
  final double? height;
  final BorderRadius? borderRadius;
  final TextStyle? style;
  final Widget? icon;
  final BoxBorder? border;
  final bool? isActive;
  final double? sizeBorder;

  final EdgeInsetsGeometry? padding;
  final List<Color>? alignmentColor;
  final List<double>? alignmentStop;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroudColor,
    this.height,
    this.borderRadius,
    this.style,
    this.icon,
    this.border,
    this.isActive = true,
    this.sizeBorder,
    this.padding,
    this.alignmentColor,
    this.alignmentStop,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    var style = widget.style ?? Component.textStyle.size_16_w_800;
    var radius = widget.borderRadius ?? Component.radius.radius12;
    var background = widget.backgroudColor ?? (widget.isActive! ? Component.color.secondary : Component.color.disable);
    double heightButton = widget.height ?? (Platform.isIOS ? 44 : 50);
    return Material(
      borderRadius: radius,
      child: InkWell(
        onTap: () {
          widget.onPressed();
        },
        borderRadius: radius,
        child: Ink(
          height: height(heightButton),
          decoration: BoxDecoration(
            color: background,
            borderRadius: radius,
          ),
          child: Container(
            padding: widget.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  widget.icon!,
                  const SizedBox(
                    width: 9,
                  ),
                ],
                Text(widget.title, style: style)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

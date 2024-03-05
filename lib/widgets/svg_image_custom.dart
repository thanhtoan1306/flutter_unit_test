import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:research_flutter_unit_test/utils/styles.dart' as styles;

class SvgImageCustom extends StatelessWidget {
  final String imagePath;
  final double size;
  final double? width;
  final double? height;
  final Color? color;
  final bool? sizeBaseOnWidth;
  const SvgImageCustom({
    Key? key,
    required this.imagePath,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.sizeBaseOnWidth = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: width != null
          ? styles.width(width)
          : sizeBaseOnWidth!
              ? styles.width(size)
              : styles.height(size),
      height: height != null
          ? styles.height(height)
          : sizeBaseOnWidth!
              ? styles.width(size)
              : styles.height(size),
      fit: BoxFit.contain,
    );
  }
}

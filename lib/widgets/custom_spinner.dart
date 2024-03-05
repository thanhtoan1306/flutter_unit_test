import 'package:flutter/material.dart';

class CustomSpinner extends StatelessWidget {
  final double? height;

  const CustomSpinner({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

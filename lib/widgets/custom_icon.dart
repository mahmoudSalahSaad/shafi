import 'package:flutter/material.dart';
import 'package:shafi/core/extensions/num_extensions.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final double size;

  const CustomIcon(
    this.icon, {
    this.color,
    this.size = 42,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size.sp,
    );
  }
}

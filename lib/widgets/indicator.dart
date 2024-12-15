import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';

class MyProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final double? size;

  const MyProgressIndicator(
      {super.key, this.width, this.height, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width?.h,
      child: LoadingAnimationWidget.beat(
        color: color ?? primaryColor,
        size: size ?? 60,
      ),
    );
  }
}

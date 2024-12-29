import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/tap_effect.dart';

import '../../core/resources/resources.dart';
import '../core/resources/color.dart';
import 'indicator.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double paddingV = 6;
  final double paddingH = 6;
  final double marginV = 6;
  final double marginH = 6;
  final bool loading;
  final TextStyle? textStyle;

  final bool fullWidth = false;
  final bool shadow = false;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? radius;

  final VoidCallback? onTap;
  final Widget? prefixWidget;

  const CustomButton(
      {super.key,
      this.buttonText,
      this.width,
      this.height,
      this.radius,
      this.textStyle,
      this.borderColor,
      this.padding,
      this.margin,
      this.loading = false,
      this.backgroundColor,
      this.textColor,
      this.onTap,
      this.prefixWidget});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(loading);
    }
    return TapEffect(
      isClickable: !loading,
      onClick: loading ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50.h,
        width: loading ? 50.w : width,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        decoration: BoxDecoration(
          border: borderColor != null
              ? Border.all(
                  color: borderColor ??
                      backgroundColor ??
                      Theme.of(context).primaryColorDark)
              : null,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5), // changes position of shadow
          ],
          color: backgroundColor ?? primaryColorDark,
          //     gradient: LinearGradient(
          //                         colors: [Color(0xffFD4A51), ColorManager.red, Colors.red],
          //                         begin: Alignment.topCenter,
          //                         end: Alignment.bottomCenter,
          //                       ),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 14.r),
          ),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          width: loading ? 50.w : width,
          child: Center(
              child: loading
                  ? MyProgressIndicator(
                      color: Colors.white,
                      size: 20.h,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        prefixWidget != null
                            ? prefixWidget!
                            : const SizedBox.shrink(),
                        prefixWidget != null
                            ? SizedBox(
                                width: 10.w,
                              )
                            : const SizedBox.shrink(),
                        CustomText("$buttonText",
                            color: textColor ?? primaryColorDark,
                            size: 14.h,
                            bold: true),
                      ],
                    )),
        ),
      ),
    );
  }
}

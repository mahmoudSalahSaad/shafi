import 'package:flutter/material.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';

import '../core/resources/font_manager.dart';

class CustomText extends StatelessWidget {
  final String message;
  final double size;
  final TextAlign align;
  final double pv;
  final double ph;
  final bool bold;
  final int? maxLines;
  final bool white;
  final Color color;
  final TextDecoration? textDecoration;
  const CustomText(
    this.message, {
    super.key,
    this.size = 14,
    this.align = TextAlign.center,
    this.pv = 4,
    this.ph = 4,
    this.bold = false,
    this.maxLines,
    this.white = false,
    this.color = Colors.black87,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ph, vertical: pv),
      child: Text(
        message,
        style: TextStyle(
            color: white ? Colors.white : color,
            fontSize: size,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontFamily: "cairo",
            height: 1.h,
            decoration: textDecoration,
            decorationColor: white ? Colors.white : color),
        textAlign: align,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
      ),
    );
  }

  copyWith(String message,
      {double? size,
      TextAlign? align,
      double? pv,
      double? ph,
      bool? bold,
      int? maxLines,
      bool? white,
      Color? color,
      TextDecoration? textDecoration}) {
    return CustomText(
      message,
      size: size ?? this.size,
      align: align ?? this.align,
      pv: pv ?? this.pv,
      ph: ph ?? this.ph,
      bold: bold ?? this.bold,
      maxLines: maxLines ?? this.maxLines,
      white: white ?? this.white,
      color: color ?? this.color,
      textDecoration: textDecoration ?? this.textDecoration,
    );
  }
}

extension TextCustom on CustomText {
  CustomText start() => (this).copyWith(message, align: TextAlign.start);
  CustomText headerExtra() => (this).copyWith(message,
      size: size + (4), bold: bold, white: white, color: color);
  CustomText header() => (this).copyWith(message,
      size: size + (2), bold: bold, white: white, color: color);
  CustomText underline() => (this).copyWith(message,
      size: size,
      bold: bold,
      white: white,
      color: color,
      textDecoration: textDecoration);
  CustomText footer() => (this).copyWith(message,
      size: size - (2), bold: bold, white: white, color: color);
  CustomText footerExtra() => (this).copyWith(message,
      size: size - (4), bold: bold, white: white, color: color);
}

extension TextCustomStyle on TextStyle {
  TextStyle customColor(Color color) => (this).copyWith(color: color);
  TextStyle colorWhite() => (this).copyWith(color: Colors.white);
  TextStyle errorStyle() => (this).copyWith(color: errorColor);
  TextStyle hintStyle() => (this).copyWith(color: textSecondary);
  TextStyle boldStyle() => (this).copyWith(fontWeight: FontWeight.bold);
  TextStyle underLineStyle() =>
      (this).copyWith(decoration: TextDecoration.underline);
  TextStyle titleStyle({double fontSize = 16}) => (this).copyWith(
      fontSize: fontSize.sp,
      color: textPrimary,
      fontWeight: FontWeight.w700,
      fontFamily: FontConstants.fontFamily);
  TextStyle descriptionStyle({double fontSize = 12}) => (this).copyWith(
      fontSize: fontSize.sp,
      color: textSecondary,
      fontWeight: FontWeight.w300,
      fontFamily: FontConstants.fontFamily);
}

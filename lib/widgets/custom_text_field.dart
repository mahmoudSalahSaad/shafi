import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/widgets/tap_effect.dart';

class CustomTextField extends ConsumerStatefulWidget {
  final double? width;
  final String? hint;
  final TextEditingController? controller;
  final void Function()? onTep;
  final String? Function(String?)? onValidate;
  final Function(String?)? onChange;
  final Function(String?)? onSubmit;
  final bool? isPassword;
  final Widget? prefixIcon;
  final bool? error;
  final Widget? phoneWidget;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormats;
  final int? maxLines;
  final String? initalValue;

  const CustomTextField(
      {super.key,
      this.width,
      this.hint,
      this.controller,
      this.onTep,
      this.onValidate,
      this.onChange,
      this.onSubmit,
      this.isPassword,
      this.prefixIcon,
      this.error,
      this.phoneWidget,
      this.maxLength,
      this.textInputType,
      this.inputFormats,
      this.maxLines,
      this.initalValue});

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 350.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          offset: const Offset(0, 0),
          blurRadius: 58,
        ),
      ], borderRadius: BorderRadius.circular(8.h)),
      child: TextFormField(
        initialValue: widget.initalValue,
        maxLines: widget.maxLines ?? 1,
        textAlign: TextAlign.center,
        textDirection:
            ref.watch(userControllerProvider).requireValue.locale == "en"
                ? TextDirection.ltr
                : TextDirection.ltr,
        inputFormatters: widget.inputFormats,
        maxLength: widget.maxLength,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
            errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                height: 1.1,
                fontSize: 12.h,
                fontFamily: "cairo"),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            constraints: BoxConstraints(minHeight: 80.h, maxHeight: 80.h),
            fillColor: Colors.white,
            filled: true,
            // contentPadding: EdgeInsets.symmetric(vertical: 22.h , horizontal: 10.w),
            hintText: widget.hint ?? "Username",
            counterText: "",
            prefixIcon:
                widget.prefixIcon ?? const Icon(Icons.person_outline_outlined),
            hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: primaryColorDark,
                fontWeight: FontWeight.w400,
                height: 1.8,
                fontSize: 12.h,
                fontFamily: "cairo"),
            hintTextDirection: TextDirection.rtl,
            suffixIcon: widget.isPassword!
                ? TapEffect(
                    onClick: () {
                      setState(() {
                        secure = !secure;
                      });
                    },
                    child: secure
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: primaryColor,
                            size: 10.h,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: primaryColor,
                            size: 10.h,
                          ))
                : widget.phoneWidget),
        controller: widget.controller,
        onTap: widget.onTep,
        onChanged: widget.onChange,
        onSaved: widget.onSubmit,
        validator: widget.onValidate,
        obscureText: widget.isPassword != null
            ? widget.isPassword!
                ? secure
                : false
            : false,
      ),
    );
  }
}

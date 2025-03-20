import 'package:flutter/material.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/values_manager.dart';
import 'package:shafi/core/utils/validators.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class ForgetPasswordLayoutWidget extends StatefulWidget {
  const ForgetPasswordLayoutWidget({
    super.key,
    required this.formKey,
    required this.textEditingController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;

  @override
  State<ForgetPasswordLayoutWidget> createState() =>
      _ForgetPasswordLayoutWidgetState();
}

class _ForgetPasswordLayoutWidgetState
    extends State<ForgetPasswordLayoutWidget> {
  @override

  /// Builds the forget password layout widget.
  ///
  /// It includes a text that says "نسيت كلمةالمرور" and a form with a
  /// single field for the user to enter their email address.
  ///
  /// The form is wrapped in a [Column] and includes a [CustomText] widget
  /// at the top.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth,
      child: Column(
        children: [
          /// The title of the widget
          CustomText(
            S.of(context).forget_password_question,
            size: 22.h,
            bold: true,
          ),
          SizedBox(
            height: 16.h,
          ),

          /// The form to enter the email address
          Form(
              key: widget.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// The instruction text
                    CustomText(
                      "برجاء ادخال رقم الهاتف وستصلك رساله لاكمال العمليه",
                      align: TextAlign.start,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    

                    CustomTextField(
                      isPassword: false,
                      controller: widget.textEditingController,
                      prefixIcon: Icon(Icons.phone_android_rounded),
                      hint: "0011222333444",
                      inputFormats: [],
                      onValidate: (value) {
                        if (value != null) {
                          if (Validators.phoneNumber(value)) {
                            return null;
                          } else {
                            return S.of(context).phone_limit_message;
                          }
                        } else {
                          return S.of(context).password_field_required;
                        }
                      },
                      textInputType: TextInputType.phone,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

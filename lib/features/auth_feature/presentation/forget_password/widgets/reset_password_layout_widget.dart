import 'package:flutter/material.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class ResetPasswordLayoutWidget extends StatefulWidget {
  const ResetPasswordLayoutWidget({
    super.key,
    required this.formKey,
    required this.passwordEc,
    required this.confirmPasswordEC,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController passwordEc;
  final TextEditingController confirmPasswordEC;

  @override
  State<ResetPasswordLayoutWidget> createState() =>
      _ResetPasswordLayoutWidgetState();
}

class _ResetPasswordLayoutWidgetState extends State<ResetPasswordLayoutWidget> {
  @override

  /// Builds the reset password layout widget.
  ///
  /// It includes a form with two required fields for the new password
  /// and a confirm password.
  ///
  /// The form fields are:
  /// - New password
  /// - Confirm password
  ///
  /// The widget is wrapped in a [Column] and includes a [CustomText]
  /// widget with the title "برجاء ادخال كلمة المرور الجديده" at the top.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title of the form
            CustomText(
              "برجاء ادخال كلمة المرور الجديده",
              size: 14.h,
            ),
            SizedBox(
              height: 16.h,
            ),

            /// Form with the required fields
            Form(
              key: widget.formKey,
              child: Column(
                children: [
                  /// New password field
                  /// Password
                  CustomTextField(
                    controller: widget.passwordEc,
                    isPassword: true,
                    maxLines: 1,
                    onValidate: (value) {
                      if (value != null) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return S.of(context).password_field_required;
                        }
                      } else {
                        return S.of(context).password_field_required;
                      }
                    },
                    hint: S.of(context).password,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 14.h,
                      color: primaryColorDark,
                    ),
                  ),

                  /// Confirm password
                  CustomTextField(
                    isPassword: true,
                    maxLines: 1,
                    hint: S.of(context).confirm_password,
                    controller: widget.confirmPasswordEC,
                    onValidate: (value) {
                      if (value != null) {
                        if (value.isNotEmpty) {
                          if (value == widget.passwordEc.text) {
                            return null;
                          } else {
                            return S.of(context).confirm_password_not_match;
                          }
                        } else {
                          return S.of(context).confirm_password_field_required;
                        }
                      } else {
                        return S.of(context).confirm_password_field_required;
                      }
                    },
                    prefixIcon: Icon(
                      Icons.lock,
                      color: primaryColorDark,
                      size: 14.h,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

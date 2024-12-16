import 'package:flutter/material.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class ResetPasswordLayoutWidget extends StatelessWidget {
  const ResetPasswordLayoutWidget({
    super.key,
  });

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
              child: Column(
                children: [
                  /// New password field
                  CustomTextField(
                    isPassword: true,
                    hint: "كلمة المرور",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  /// Confirm password field
                  CustomTextField(
                    isPassword: true,
                    hint: "تأكيد كلمة المرور",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

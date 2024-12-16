import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/utils/validators.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/presentation/register/controllers/register_controller.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class RegisterLayoutWidget extends ConsumerStatefulWidget {
  const RegisterLayoutWidget({
    super.key,
  });

  @override
  ConsumerState<RegisterLayoutWidget> createState() =>
      _RegisterLayoutWidgetState();
}

class _RegisterLayoutWidgetState extends ConsumerState<RegisterLayoutWidget> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      ref
          .read(registerControllerProvider.notifier)
          .register(
            UserEntity(
                phone: "+964${phone.text}",
                password: password.text,
                confirmPassword: confirmPassword.text,
                name: "${firstName.text} ${lastName.text}"),
          );
    }
  }

  @override

  /// Builds the register layout widget.
  ///
  /// This widget includes a form with the required fields for registration,
  /// and a button to submit the form.
  ///
  /// The form fields are:
  /// - First name
  /// - Last name
  /// - Phone number
  /// - Password
  /// - Confirm password
  ///
  /// The widget is wrapped in a [Column] and includes a [CustomText]
  /// widget with the title "تسجيل حساب جديد" at the top.
  ///
  /// The form is validated on submission, and if it is valid, the
  /// [RegisterController.register] function is called with the user's
  /// input data.
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Title of the form
        CustomText(
          "تسجيل حساب جديد",
          size: 22.h,
          bold: true,
        ),
        SizedBox(
          height: 40.h,
        ),

        /// Form with the required fields
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                /// First name and last name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// First name
                    CustomTextField(
                      isPassword: false,
                      controller: firstName,
                      width: 154.w,
                      onValidate: (value) {
                        if (value != null) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "هذا الحقل مطلوب";
                          }
                        } else {
                          return "هذا الحقل مطلوب";
                        }
                      },
                      hint: "الاسم الول",
                      prefixIcon: Icon(
                        Icons.hdr_strong_outlined,
                        size: 14.h,
                      ),
                    ),

                    /// Last name
                    CustomTextField(
                      isPassword: false,
                      controller: lastName,
                      hint: "اسم العائله",
                      onValidate: (value) {
                        if (value != null) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "هذا الحقل مطلوب";
                          }
                        } else {
                          return "هذا الحقل مطلوب";
                        }
                      },
                      width: 154.w,
                      prefixIcon: Icon(
                        Icons.hdr_strong_outlined,
                        size: 14.h,
                      ),
                    ),
                  ],
                ),

                /// Phone number
                CustomTextField(
                  isPassword: false,
                  controller: phone,
                  prefixIcon: Icon(Icons.phone_android_rounded),
                  hint: "رقم الهااتف",
                  maxLength: 9,
                  inputFormats: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onValidate: (value) {
                    if (value != null) {
                      if (Validators.phoneNumber(value)) {
                        return null;
                      } else {
                        return "رقم الهاتف يتكون من 9 ارقام";
                      }
                    } else {
                      return "برجاء ادخال رقم الهاتف";
                    }
                  },
                  textInputType: TextInputType.phone,
                  phoneWidget: Padding(
                    padding: EdgeInsets.all(14.0.r),
                    child: CustomText(
                      "964+",
                      bold: true,
                    ),
                  ),
                ),

                /// Password
                CustomTextField(
                  controller: password,
                  isPassword: true,
                  maxLines: 1,
                  onValidate: (value) {
                    if (value != null) {
                      if (value.isNotEmpty) {
                        return null;
                      } else {
                        return "برجاء ادخال كلمة المرور";
                      }
                    } else {
                      return "برجاء ادخال كلمة المرور";
                    }
                  },
                  hint: "كلمة المرور",
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 14.h,
                  ),
                ),

                /// Confirm password
                CustomTextField(
                  isPassword: true,
                  maxLines: 1,
                  hint: "تأكيد كلمة المرور",
                  controller: confirmPassword,
                  onValidate: (value) {
                    if (value != null) {
                      if (value.isNotEmpty) {
                        if (value == password.text) {
                          return null;
                        } else {
                          return "تأكيد كلمة المرور يجب ان تتوافق مع كلمة المرور";
                        }
                      } else {
                        return "برجاء ادخال كلمة المرور";
                      }
                    } else {
                      return "برجاء ادخال كلمة المرور";
                    }
                  },
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 14.h,
                  ),
                ),

                /// Submit button
                CustomButton(
                  height: 44.h,
                  onTap: () async {
                    await _onSubmit();
                  },
                  buttonText: "تسجيل حساب جديد",
                  textColor: kAppBarColor,
                  radius: 10.r,
                  loading: ref.watch(registerControllerProvider).isLoading,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

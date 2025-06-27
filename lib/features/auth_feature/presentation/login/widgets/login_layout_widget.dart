import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/presentation/login/controllers/login_controller.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_phone_text_field.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class LoginLayout extends ConsumerStatefulWidget {
  const LoginLayout({
    super.key,
  });

  @override
  ConsumerState<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends ConsumerState<LoginLayout> {
  final TextEditingController phoneEc = TextEditingController();
  final TextEditingController passwordEc = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      print("phoneeeeeeeeee===>${phoneEc.text}");
      await ref.read(loginControllerProvider.notifier).login(
            UserEntity(
              phone: phoneEc.text,
              password: passwordEc.text,
            ),
          );
    }
  }

  @override

  /// Builds the login layout widget.
  ///
  /// This widget includes a form with fields for phone number and password,
  /// and a button to submit the form. It also provides a link to reset the password.
  ///
  /// The widget is wrapped in a [SingleChildScrollView] to make it scrollable.
  /// The form fields are:
  /// - Phone number input field
  ///   - Its prefix icon is a phone icon.
  ///   - It is validated to make sure it is a valid phone number.
  ///   - It is limited to 9 digits.
  /// - Password input field
  ///   - Its prefix icon is a lock icon.
  ///   - It is validated to make sure it is not empty.
  /// The form also includes a link to reset the password.
  /// When the form is submitted, it calls the [_onSubmit] function.
  ///
  /// [_onSubmit] is a function that is called when the form is submitted.
  /// It validates the form fields and calls the [LoginController.login] function
  /// with the user's phone number and password.
  ///
  /// [LoginController.login] is a function that is provided by the
  /// [loginControllerProvider]. It takes a [UserEntity] object with the user's
  /// phone number and password and logs the user in.
  ///
  /// If the user is successfully logged in, it navigates to the home page.
  ///
  /// If the user is not successfully logged in, it shows a snack bar with an
  /// error message.
  ///
  /// The widget is wrapped in a [Form] widget to make it a form.
  /// The form is validated when the user submits it.
  ///
  /// The widget is wrapped in a [Padding] widget to add some padding to the
  /// form.
  ///
  /// The widget is wrapped in a [Column] widget to make it a column.
  /// The column is centered horizontally.
  ///
  /// The widget is wrapped in a [SingleChildScrollView] widget to make it
  /// scrollable.
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title of the login form
          CustomText(
            S.of(context).login,
            size: 22.h,
            bold: true,
          ),
          SizedBox(
            height: 40.h,
          ),

          /// Login form
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomPhoneTextField(
                    controller: phoneEc,
                    initialCountryCode: "IQ",
                    onChanged: (p0) {
                      phoneEc.text = p0.completeNumber;
                    },
                  ),

                  /// Phone number input field
                  // CustomTextField(
                  //   isPassword: false,
                  //   controller: phoneEc,
                  //   prefixIcon: Icon(Icons.phone_android_rounded),
                  //   hint: "96411222333444+",
                  //   phoneWidget: SizedBox(),
                  //   inputFormats: [],
                  //   onValidate: (value) {
                  //     if (value != null) {
                  //       if (Validators.phoneNumber(value)) {
                  //         return null;
                  //       } else {
                  //         return S.of(context).phone_limit_message;
                  //       }
                  //     } else {
                  //       return S.of(context).phone_field_required;
                  //     }
                  //   },
                  //   textInputType: TextInputType.phone,
                  // ),
                  SizedBox(
                    height: 16.h,
                  ),

                  /// Password input field
                  CustomTextField(
                    isPassword: true,
                    controller: passwordEc,
                    maxLines: 1,
                    hint: S.of(context).password,
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
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 14.h,
                    ),
                  ),

                  /// Forgot password link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            NavigationService.push(Routes.forgetPassword),
                        child: CustomText(
                          S.of(context).forget_password_question,
                          color: primaryOrangeColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  /// Submit button
                  CustomButton(
                    height: 44.h,
                    buttonText: S.of(context).login,
                    onTap: () => _onSubmit(),
                    textColor: kAppBarColor,
                    radius: 10.r,
                    loading: ref.watch(loginControllerProvider).isLoading,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//print mahmoud salah saad 

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/resources/values_manager.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/controllers/otp_controller.dart';
import 'package:shafi/widgets/custom_text.dart';

class OtpLayoutWidget extends ConsumerStatefulWidget {
  const OtpLayoutWidget(
      {super.key, required this.textEditingController, required this.formKey});

  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtpLayoutWidgetState();
}

class _OtpLayoutWidgetState extends ConsumerState<OtpLayoutWidget> {
  double sec = 60;

  Timer? timer;
  _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        sec = sec - 1;
        if (sec == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override

  /// Initializes the state of the widget by starting the timer.
  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the timer
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: widget.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0.w,
                horizontal: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText("برجاء ادخال الرقم المرسل اليك"),
                  SizedBox(
                    height: 16.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      controller: widget.textEditingController,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '•',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        debugPrint(
                            "validator: ${widget.textEditingController.text}");
                        if (v != null || v!.length == 6) {
                          return null;
                        } else {
                          debugPrint("validator: $v");
                          return "مطلوب";
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(16.r),
                        fieldHeight: 50.h,
                        fieldWidth: 50.h,
                        activeColor: primaryColorDark,
                        selectedColor: primaryColor,
                        selectedFillColor: primaryColor.withOpacity(0.30),
                        inactiveFillColor: kAppBarColor,
                        inactiveColor: primaryOrangeColor,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      enablePinAutofill: true,

                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint("onChanged: $value");
                      },
                      beforeTextPaste: (text) {
                        debugPrint("beforeTextPaste: $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (sec != 0)
                        CustomText(
                          sec.toStringAsFixed(0),
                          color: primaryOrangeColor,
                          bold: true,
                        ),
                      CustomText("لم تصلك؟"),
                      InkWell(
                        onTap: () {
                          if (sec == 0) {
                            debugPrint("Resend code tapped");
                            ref
                                .read(otpControllerProvider.notifier)
                                .resendCode();

                            sec = 60;
                            _startTimer();
                          }
                        },
                        child: CustomText(
                          "ارسال مره اخره",
                          textDecoration: TextDecoration.underline,
                          color: sec == 0 ? primaryOrangeColor : Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

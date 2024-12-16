import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/controllers/otp_controller.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/widgets/otp_layout_widget.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/auth_base_layout_widget.dart';
import 'package:shafi/widgets/custom_button.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  /// This widget builds the OTP screen with a scaffold layout.
  /// It includes a floating action button and an OTP layout widget as the main content.
  ///
  /// The floating action button is conditionally shown based on the visibility of the keyboard.
  /// If the keyboard is visible, the button is not shown. Otherwise, it is displayed with
  /// a loading indicator when the OTP is being sent.
  ///
  /// When the button is tapped, the form is validated and if it is valid, the OTP is sent
  /// using the [OtpController].
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Conditionally show the floating action button based on keyboard visibility
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                height: 44.h,
                buttonText: " اطلب ",
                textColor: kAppBarColor,
                backgroundColor: backgroundColor,
                radius: 10.r,
                loading: ref.watch(otpControllerProvider).isLoading,
                onTap: () async {
                  // Validate the form and send the OTP if it is valid
                  if (formKey.currentState!.validate()) {
                    await ref
                        .read(otpControllerProvider.notifier)
                        .sendOtp(otp: textEditingController.text);
                  }
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // Body of the scaffold containing the OTP layout
      body: AuthBaseLayout(
        content: OtpLayoutWidget(
          textEditingController: textEditingController,
          formKey: formKey,
        ),
      ),
    );
  }
}


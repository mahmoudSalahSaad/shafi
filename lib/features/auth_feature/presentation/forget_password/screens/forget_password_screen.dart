import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/controllers/forgot_password_controller.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/widgets/forget_password_layout_widget.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/auth_base_layout_widget.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override

  /// Builds the UI for the [ForgetPasswordScreen].
  ///
  /// This screen is responsible for showing the UI for the user to enter their
  /// email address and request a password reset.
  ///
  /// The screen consists of a [CustomButton] with text "اطلب" which is used to
  /// request the password reset. The button is only shown if the keyboard is not
  /// visible.
  ///
  /// The screen also consists of a [ForgetPasswordLayoutWidget] which is used to
  /// show the UI for the user to enter their email address.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                height: 44.h,
                buttonText: S.of(context).request,
                textColor: kAppBarColor,
                backgroundColor: backgroundColor,
                radius: 10.r,
                loading: ref.watch(forgotPasswordControllerProvider).isLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    ref
                        .read(forgotPasswordControllerProvider.notifier)
                        .forgetPassword(textEditingController.text);
                  } else {}
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: AuthBaseLayout(
          content: ForgetPasswordLayoutWidget(
        formKey: formKey,
        textEditingController: textEditingController,
      )),
    );
  }
}

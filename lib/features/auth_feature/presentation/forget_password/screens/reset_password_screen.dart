import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/controllers/forgot_password_controller.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/widgets/reset_password_layout_widget.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/auth_base_layout_widget.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordEc = TextEditingController();
    final TextEditingController confirmPasswordEC = TextEditingController();
    return Scaffold(
      // Set the background color of the screen.
      backgroundColor: Colors.white,
      // Conditionally display the floating action button when the keyboard is hidden.
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                // Define the height of the button.
                height: 44.h,
                // Text displayed on the button.
                buttonText: S.of(context).save,
                // Set the text color of the button.
                textColor: kAppBarColor,
                // Set the background color of the button.
                backgroundColor: backgroundColor,
                // Define the border radius of the button.
                radius: 10.r,
                loading: ref.watch(forgotPasswordControllerProvider).isLoading,
                // Navigate to the home route when the button is tapped.
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await ref
                        .read(forgotPasswordControllerProvider.notifier)
                        .resetPassword(UserEntity(
                            phone: "",
                            password: passwordEc.text,
                            confirmPassword: confirmPasswordEC.text,
                            Token: ref
                                    .watch(forgotPasswordControllerProvider)
                                    .requireValue
                                    .token ??
                                ""));
                  }
                },
              ),
            ),
      // Place the floating action button at the center-bottom of the screen.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // Main content of the screen.
      body: AuthBaseLayout(
        // Include the reset password widget.
        content: ResetPasswordLayoutWidget(
          formKey: formKey,
          passwordEc: passwordEc,
          confirmPasswordEC: confirmPasswordEC,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/widgets/reset_password_layout_widget.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/auth_base_layout_widget.dart';
import 'package:shafi/widgets/custom_button.dart';

class ResetPasswordScreen extends ConsumerWidget {
  const ResetPasswordScreen({super.key});

  @override
  /// Builds the reset password screen with a scaffold layout.
///
/// The screen includes a floating action button for submitting the password 
/// change and an authentication base layout displaying the reset password widget.
Widget build(BuildContext context, WidgetRef ref) {
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
              buttonText: "تغير كلمة المرور",
              // Set the text color of the button.
              textColor: kAppBarColor,
              // Set the background color of the button.
              backgroundColor: backgroundColor,
              // Define the border radius of the button.
              radius: 10.r,
              // Navigate to the home route when the button is tapped.
              onTap: () {
                NavigationService.push(Routes.home);
              },
            ),
          ),
    // Place the floating action button at the center-bottom of the screen.
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    // Main content of the screen.
    body: AuthBaseLayout(
      // Include the reset password widget.
      content: ResetPasswordLayoutWidget(),
    ),
  );
}
}

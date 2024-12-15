import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/auth_base_layout_widget.dart';
import 'package:shafi/features/auth_feature/presentation/register/widgets/register_layout_widget.dart';
import 'package:shafi/widgets/custom_button.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {

  @override
  /// Builds the register screen with a scaffold layout.
  ///
  /// The screen includes a floating action button to navigate to the login
  /// screen and an authentication base layout displaying the register layout
  /// widget.
  @override
  /// Builds the register screen with a scaffold layout.
  ///
  /// The screen includes a floating action button to navigate to the login
  /// screen and an authentication base layout displaying the register layout
  /// widget.
  ///
  /// - The floating action button is only visible when the keyboard is hidden.
  /// - The main content of the screen is wrapped in a [SingleChildScrollView].
  Widget build(BuildContext context) {
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
                buttonText: "املك حساب بالفعل",
                // Set the text color of the button.
                textColor: kAppBarColor,
                // Set the background color of the button.
                backgroundColor: backgroundColor,
                // Define the border radius of the button.
                radius: 10.r,
                // Navigate to the login route when the button is tapped.
                onTap: () {
                  NavigationService.pushNamedAndRemoveUntil(Routes.login);
                },
              ),
            ),
      // Place the floating action button at the center-bottom of the screen.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // Main content of the screen.
      body: AuthBaseLayout(
        // Include the register layout widget wrapped in a SingleChildScrollView.
        content: SingleChildScrollView(
          child: RegisterLayoutWidget(),
        ),
      ),
    );
  }
}

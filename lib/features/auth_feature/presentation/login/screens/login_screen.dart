import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/auth_base_layout_widget.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/login_layout_widget.dart';
import 'package:shafi/widgets/custom_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print("Building Login Screen");
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                height: 44.h,
                buttonText: "تسجيل حساب جديد",
                textColor: kAppBarColor,
                backgroundColor: backgroundColor,
                radius: 10.r,
                onTap: () {
                  print("Navigating to Register Screen");
                  NavigationService.push(Routes.register);
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: AuthBaseLayout(
        content: LoginLayout(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/auth_feature/presentation/login/controllers/login_controller.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/auth_base_layout_widget.dart';
import 'package:shafi/features/auth_feature/presentation/login/widgets/login_layout_widget.dart';
import 'package:shafi/generated/assets.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ssnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider).requireValue;
    print("Building Login Screen");
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: userState.country != null
                  ? userState.country == "sv"
                      ? null
                      : CustomButton(
                          height: 44.h,
                          buttonText: S.of(context).register,
                          textColor: kAppBarColor,
                          backgroundColor: backgroundColor,
                          radius: 10.r,
                          onTap: () {
                            print("Navigating to Register Screen");
                            NavigationService.push(Routes.register);
                          },
                        )
                  : null,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: AuthBaseLayout(
        content: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: userState.country == null
              ? ChooseCountryLayout()
              : userState.country == "sv"
                  ? LoginWithBankIdLayout(
                      ssnController: ssnController,
                      formKey: formKey,
                    )
                  : LoginLayout(),
        ),
      ),
    );
  }
}

class LoginWithBankIdLayout extends ConsumerStatefulWidget {
  const LoginWithBankIdLayout({
    super.key,
    required this.ssnController,
    required this.formKey,
  });
  final TextEditingController ssnController;
  final GlobalKey<FormState> formKey;
  @override
  ConsumerState<LoginWithBankIdLayout> createState() =>
      _LoginWithBankIdLayoutState();
}

class _LoginWithBankIdLayoutState extends ConsumerState<LoginWithBankIdLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth,
      height: 400.h,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Image.asset(
              Assets.appLogo,
              width: 200.h,
              height: 200.h,
            ),
            Form(
              key: widget.formKey,
              child: CustomTextField(
                hint: S.of(context).enter_ssn,
                controller: widget.ssnController,
                maxLines: 1,
                onValidate: (value) {
                  if (value == null) {
                    return S.of(context).field_required;
                  } else {
                    if (value.length != 12) {
                      return S.of(context).valid_ssn;
                    }
                  }
                  return null;
                },
                textInputType: TextInputType.number,
                isPassword: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                height: 44.h,
                loading: ref
                        .watch(loginControllerProvider)
                        .requireValue
                        .isLoginWithBankIdLoading ??
                    false,
                buttonText: "Login with BankId",
                textColor: kAppBarColor,
                backgroundColor: primaryColorDark,
                radius: 10.r,
                onTap: (ref
                            .watch(loginControllerProvider)
                            .requireValue
                            .isLoginWithBankIdLoading ??
                        false)
                    ? null
                    : () async {
                        if (widget.formKey.currentState!.validate()) {
                          ref
                              .read(loginControllerProvider.notifier)
                              .loginWithBankId(widget.ssnController.text);
                        }
                      },
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}

class ChooseCountryLayout extends ConsumerWidget {
  const ChooseCountryLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: deviceWidth,
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Image.asset(
            Assets.appLogo,
            width: 200.h,
            height: 200.h,
          ),
          SizedBox(height: 100.h),
          CustomText(
            "Choose your country",
            size: 32.sp,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ref.read(userControllerProvider.notifier).setCountry("iq");
                },
                child: Image.asset(
                  Assets.iraqFlagPng,
                  height: 50.h,
                ),
              ),
              SizedBox(width: 40.w),
              InkWell(
                onTap: () {
                  ref.read(userControllerProvider.notifier).setCountry("sv");
                },
                child: Image.asset(
                  Assets.swedenFlagPng,
                  height: 50.h,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ref.read(userControllerProvider.notifier).setCountry("dk");
                },
                child: Image.asset(
                  Assets.dkFlag,
                  height: 50.h,
                  width: 74.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 40.w),
              InkWell(
                onTap: () {
                  ref.read(userControllerProvider.notifier).setCountry("fi");
                },
                child: Image.asset(
                  Assets.fiFlag,
                  height: 50.h,
                  width: 74.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ref.read(userControllerProvider.notifier).setCountry("fr");
                },
                child: Image.asset(
                  Assets.frFlag,
                  height: 50.h,
                  width: 74.w,
                ),
              ),
              SizedBox(width: 40.w),
              InkWell(
                onTap: () {
                  ref.read(userControllerProvider.notifier).setCountry("no");
                },
                child: Image.asset(
                  Assets.noFlag,
                  height: 50.h,
                  width: 74.w,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

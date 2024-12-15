import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/generated/assets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}


class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      UserModel? userModel =
          await ref.read(userControllerProvider.notifier).getUser();
      if (userModel != null) {
        await ref.read(userControllerProvider.notifier).refreshToken();
        NavigationService.pushNamedAndRemoveUntil(Routes.home);
      } else {
        NavigationService.pushNamedAndRemoveUntil(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: BoxDecoration(color: backgroundColor),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: LottieBuilder.asset(
              Assets.splashLottie,
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Image.asset(Assets.logo),
          )),
        ],
      ),
    );
  }
}
